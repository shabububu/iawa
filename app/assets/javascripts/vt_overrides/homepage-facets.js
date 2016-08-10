$(document).ready(function(){
  var FacetImageHandler = {
    $item: null,
    liSize: {},

    init: function() {
      this.$item = $('.item-entry-li');
      this.liSize = {
        width: 150,
        height: 150
      };
    },

    run: function() {
      this.setImageListeners();
      this.centerFacetPics();
    },

    setImageListeners: function() {
      this.$item.hover(function(){
        $(this).find('.image-overlay-wrapper').show();
      })
      this.$item.mouseleave(function(){
        $(this).find('.image-overlay-wrapper').hide();
      });
    },

    centerFacetPics: function() {
      var _this = this;
      this.$item.each(function(){
        var $imgElement = $(this).find('img');
        var imgSrc = $imgElement.attr("src");
        var img = new Image();
        img.addEventListener("load", function(){
          _this.imageOnload(img, $imgElement);
        })
        img.src = imgSrc;
      })
    },

    imageOnload: function(imgObject, $imgElement) {
      // Landscape
      if(imgObject.width > imgObject.height) {
        this.resizeLandscape($imgElement, imgObject.width);
      }
      // Portrait
      else if(imgObject.height > imgObject.width) {
        this.resizePortrait($imgElement, imgObject.height);
      }
      // Square
      else {
        this.resizeSquare($imgElement);
      }
    },

    resizeLandscape: function($img, oldWidth){
      $img.height(this.liSize.height);
      var adjustedWidth = ($img.width() - oldWidth) / -2;
      $img.css('margin-left', adjustedWidth);

    },

    resizePortrait: function($img, oldHeight){
      $img.width(this.liSize.width);
      var adjustedHeight = ($img.height() - oldHeight) / -2;
      $img.css('margin-top', adjustedHeight);
    },

    resizeSquare: function($img){
      $img.width(this.liSize.width);
      $img.height(this.liSize.height);
    }
  };

  FacetImageHandler.init();
  FacetImageHandler.run();
})

