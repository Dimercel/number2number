import Test.Hspec

import Number2Number.Converter (decToOther, otherToDec)


main :: IO ()
main = hspec $ do
  describe "Tests for decToOther" $ do
    it "Negative radix" $ do
      (decToOther 10 (-8)) `shouldBe` Nothing
    it "Very large radix" $ do
      (decToOther 10 1000) `shouldBe` Nothing
    it "Very small radix" $ do
      (decToOther 10 1) `shouldBe` Nothing
    it "Correct sample" $ do
      (decToOther 255 16) `shouldBe` Just "FF"
  describe "Tests for otherToDec" $ do
    it "Negative radix" $ do
      (otherToDec "FF" (-8)) `shouldBe` Nothing
    it "Very large radix" $ do
      (otherToDec "FF" 1000) `shouldBe` Nothing
    it "Very small radix" $ do
      (otherToDec "FF" 1) `shouldBe` Nothing
    it "Empty number" $ do
      (otherToDec "" 10) `shouldBe` Nothing
    it "Correct sample" $ do
      (otherToDec "FF" 16) `shouldBe` Just 255
