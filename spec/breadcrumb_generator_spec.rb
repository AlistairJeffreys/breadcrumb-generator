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

      context "when given the base url" do
        let(:url) { "https://www.btplc.com/" }

        it "returns HOME surrounded by an href tag" do
          expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a>'
        end

        context "with a single domain" do
          let(:url) { "https://www.btplc.com/SITES/" }

          it "returns HOME and the domain in href tags" do
            expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> : <a href="/SITES/">SITES</a>'
          end
  
          context "with a page" do
            let(:url) { "https://www.btplc.com/SITES/ADASTRAL.HTML" }

            it "returns HOME and the domain in href tags and the page in span tags" do
              expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> : <a href="/SITES/">SITES</a> : <span class="active">ADASTRAL</span>'
            end
          end

          context "with an index page" do
            let(:url) { "https://www.btplc.com/careercentre/index.htm" }

            it "returns the breadcrumb without the page" do
              expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> : <a href="/careercentre/">CAREERCENTRE</a>'
            end
          end
        end

        context "with multiple domains" do
          let(:url) { "https://www.btplc.com/careercentre/vacancies/" }

          it "returns HOME and the domain in href tags" do
            expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> : <a href="/careercentre/">CAREERCENTRE</a> : <a href="/careercentre/vacancies/">VACANCIES</a>'
          end
  
          context "with a page" do
            let(:url) { "https://www.btplc.com/careercentre/vacancies/Technology.htm" }

            it "returns HOME and the domain in href tags and the page in span tags" do
              expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> : <a href="/careercentre/">CAREERCENTRE</a> : <a href="/careercentre/vacancies/">VACANCIES</a> : <span class="active">TECHNOLOGY</span>'
            end
          end
        end
      end
    end

    context "with a slash seperator" do
      let(:seperator) { " / " }

      context "when given only the base url" do
        let(:url) { "https://www.btplc.com/" }

        it "returns HOME surrounded by an href tag" do
          expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a>'
        end
      end

      context "when given the base url and a domain" do
        let(:url) { "https://www.btplc.com/careercentre/" }

        it "returns HOME and the domain in href tags" do
          expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> / <a href="/careercentre/">CAREERCENTRE</a>'
        end
      end

      context "when given the base url, domain and page" do
        let(:url) { "https://www.btplc.com/careercentre/Technology.htm" }

        it "returns HOME and the domain in href tags and the page in span tags" do
          expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> / <a href="/careercentre/">CAREERCENTRE</a> / <span class="active">TECHNOLOGY</span>'
        end
      end
    end

    context "when the page url segment is longer than 20 characters" do
      let(:url) { "https://www.bt.com/very-long-url-to-make-a-silly-yet-meaningful-example/example.html" }
      let(:seperator) { " : " }

      it "returns HOME and the shortened domain in href tags and the page in span tags" do
        expect(subject.breadcrumb_function(url, seperator)).to eq '<a href="/">HOME</a> : <a href="/very-long-url-to-make-a-silly-yet-meaningful-example/">VLUMSYME</a> : <span class="active">EXAMPLE</span>'
      end
    end
  end
end