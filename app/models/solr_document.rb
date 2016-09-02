# frozen_string_literal: true
class SolrDocument
  include Blacklight::Solr::Document
  include Blacklight::Gallery::OpenseadragonSolrDocument

  # Adds CurationConcerns behaviors to the SolrDocument.
  include CurationConcerns::SolrDocumentBehavior
  # Adds Sufia behaviors to the SolrDocument.
  include Sufia::SolrDocumentBehavior



  # self.unique_key = 'id'

  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension(Blacklight::Document::Email)

  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension(Blacklight::Document::Sms)

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)

  # Do content negotiation for AF models. 

  use_extension( Hydra::ContentNegotiation )

  def coverage
    self[Solrizer.solr_name('coverage')]
  end
  
  def rights
    first(Solrizer.solr_name('rights'))
  end
  def medium
    self[Solrizer.solr_name('medium')]
  end

  def bibliographic_citation
    self[Solrizer.solr_name('bibliographic_citation')]
  end

  def rights_holder
    self[Solrizer.solr_name('rights_holder')]
  end

  def tags
    self[Solrizer.solr_name('tags')]
  end

  def part_of
    self[Solrizer.solr_name('part_of')]
  end

  def format
    self[Solrizer.solr_name('format')]
  end
end
