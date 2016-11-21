class DNA
  def initialize(strand)
    @original_dna = strand.chars
  end

  def hamming_distance(new_strand)
    both_strands = new_strand.chars.zip(@original_dna)
    count_differences(both_strands)
  end

  private

  def count_differences(both)
    both.count { |pair| pair.first != pair.last && !pair.last.nil? }
  end
end
