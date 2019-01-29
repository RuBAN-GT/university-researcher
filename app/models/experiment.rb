class Experiment < ApplicationRecord
  self.per_page = 20

  # relations
  belongs_to :position

  # validations
  validates :sequence, :presence => true

  # Get aligned sequence object
  #
  # @param [Array] seqs
  # @return [Bio::Alignment|Nil]
  def self.bio_sequence(seqs)
    return nil if !seqs.is_a?(Array) || seqs.length == 0

    seqs = seqs.collect do |item|
      Bio::Sequence::NA.new item
    end

    Bio::Alignment.new seqs
  end

  # Get aligned sequence value
  #
  # @param [Array] seqs
  # @return [String|Nil]
  def self.aligned_sequence(seqs)
    seq = bio_sequence seqs

    seq.nil? ? '' : seq.consensus_iupac.upcase
  end

  # Get aligned sequence object handled in ClustalW
  #
  # @param [Array] seqs
  # @return [Bio::Alignment|Nil]
  def self.bio_clusted_sequence(seqs)
    seq = bio_sequence seqs

    return nil if seq.nil?

    fac = Bio::ClustalW.new

    seq = seq.do_align fac
  end

  # Get aligned sequence string handled in ClustalW
  #
  # @param [Array] seqs
  # @return [String|Nil]
  def self.clusted_aligned_sequence(seqs)
    begin
      bio_clusted_sequence(seqs).consensus
    rescue
      aligned_sequence seqs
    end
  end
end
