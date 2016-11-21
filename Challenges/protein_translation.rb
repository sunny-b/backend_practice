class InvalidCodonError < StandardError; end

class Translation
  CODONS = { %w(AUG)             => 'Methionine',
             %w(UUU UUC)         => 'Phenylalanine',
             %w(UUA UUG)         => 'Leucine',
             %w(UCU UCC UCA UCG) => 'Serine',
             %w(UAU UAC)         => 'Tyrosine',
             %w(UGU UGC)         => 'Cysteine',
             %w(UGG)             => 'Tryptophan',
             %w(UAA UAG UGA)     => 'STOP'}


  def self.of_codon(codon)
    key = CODONS.keys.select { |pairs| pairs.include? codon }
    CODONS.fetch(key.first) { raise InvalidCodonError }
  end

  def self.of_rna(strand)
    strand.chars.each_slice(3).with_object([]) do |codon_chars, result|
      codon = self.of_codon(codon_chars.join(''))
      break result if codon == 'STOP'
      result << codon
    end
  end
end
