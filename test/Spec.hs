import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
    describe "Lib.parse" $ do
        it "returns a basic Incomplete Todo" $ do
            parse "A basic todo" `shouldBe` (Incomplete "A basic todo" Nothing Nothing [] [])

        it "returns a basic Complete Todo" $ do
            parse "x 2016-02-18 A basic todo" `shouldBe` (Complete "A basic todo" "2016-02-18" Nothing [] [])
