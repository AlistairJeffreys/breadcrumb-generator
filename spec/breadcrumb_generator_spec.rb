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

      context "when given the base url and a domain" do
        context "without a trailing /" do
          let(:url) { "https://www.btplc.com/SITES" }

          it "returns HOME and the domain in href tags" do
            expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> : <a href="/SITES/">SITES</a>'
          end
        end

        context "with a trailing /" do
          let(:url) { "https://www.btplc.com/SITES/" }

          it "returns HOME and the domain in href tags" do
            expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> : <a href="/SITES/">SITES</a>'
          end
        end
      end

      context "when given the base url, domain and page" do
        context "without a file extension" do
          let(:url) { "https://www.btplc.com/SITES/ADASTRAL" }

          it "returns HOME and the domain in href tags and the page in span tags" do
            expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> : <a href="/SITES/">SITES</a> : <span class="active">ADASTRAL</span>'
          end
        end

        context "with the file extension" do
          let(:url) { "https://www.btplc.com/SITES/ADASTRAL.HTML" }

          it "returns HOME and the domain in href tags and the page in span tags" do
            expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> : <a href="/SITES/">SITES</a> : <span class="active">ADASTRAL</span>'
          end
        end
      end
    end
  end
end