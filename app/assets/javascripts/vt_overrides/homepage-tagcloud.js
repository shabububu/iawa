var TagCloudHandler = {
  $typeContainer: null,
  $tagContainer: null,
  $tagPanel: null,
  wordArray: null,

  init: function() {
    this.$typeContainer = $('#type-group');
    this.$tagContainer = $('#cloud-tag-container');
    this.$tagPanel = $('#tag-panel');
    this.wordArray = [];
    this.$tagContainer.empty();
  },

  run: function() {
    this.setTagContainerSize();
    this.buildWordArray();
    this.addCloud();
  },

  setTagContainerSize: function() {
    this.$tagContainer
      .height(200)
      .width(this.$typeContainer.width());
  },

  buildWordArray: function() {
    var _this = this;
    var $tagItems = this.$tagPanel.find('li');
    $tagItems.each(function(){
      var $link = $(this).find('a');
      var label = $link.text();
      var facetCount = $(this).find('.facet-count').text();
      var href = $link.attr('href');
      _this.wordArray.push({
        text: label,
        weight: facetCount,
        link: href
      });
    });
  },

  addCloud: function() {
    this.$tagContainer.jQCloud(this.wordArray);
  }
};

var tagCloudHandler = function() {
  TagCloudHandler.init();
  TagCloudHandler.run();
}
