require 'spec_helper'

describe ReverseMarkdown::Converters::Figure do
  let(:converter) { ReverseMarkdown::Converters::Figure.new }

  it 'returns an empty string if the node is empty' do
    input = node_for('<figure></figure>')
    expect(converter.convert(input)).to eq ''
  end

  it 'returns only the contents if it does not contain an image' do
    input = node_for('<figure><figcaption>foo</figcaption></figure>')
    expect(converter.convert(input)).to eq '<figcaption>foo</figcaption>'
  end

  it 'returns an image with caption' do
    input = node_for('<figure><figcaption>foo</figcaption><img src="foo.png"/></figure>')
    expect(converter.convert(input)).to eq ' ![foo](foo.png)'
  end
end
