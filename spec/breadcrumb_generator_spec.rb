require "./lib/breadcrumb_generator"

describe BreadcrumbGenerator do
  subject { described_class.new }

  describe ".breadcrumb_function" do
    context "when the arguments are invalid" do
      context "when both arguments are nil" do
        it "returns nil" do
          expect(subject.breadcrumb_function(nil, nil))
        end
      end

      context "when the url is nil" do
        it "returns nil" do
          expect(subject.breadcrumb_function(nil, " : "))
        end
      end

      context "when the seperator is nil" do
        it "returns nil" do
          expect(subject.breadcrumb_function("https://www.btplc.com/SITES/ADASTRAL.HTML", nil))
        end
      end
    end

    context "with a colon seperator" do
      let(:seperator) { " : " }

      context "when given only the base url" do
        context "without a trailing /" do
          let(:url) { "https://www.btplc.com" }

          it "returns HOME surrounded by an href tag" do
            expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a>'
          end
        end

        context "with a trailing /" do
          let(:url) { "https://www.btplc.com/" }

          it "returns HOME surrounded by an href tag" do
            expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a>'
          end
        end
      end
    end
  end
end