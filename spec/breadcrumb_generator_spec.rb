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

      context "when the first argument is nil" do
        it "returns nil" do
          expect(subject.breadcrumb_function(nil, " : "))
        end
      end

      context "when the second argument is nil" do
        it "returns nil" do
          expect(subject.breadcrumb_function("https://www.btplc.com/SITES/ADASTRAL.HTML", nil))
        end
      end
    end
  end

end