{-# LANGUAGE OverloadedStrings #-}

module Main where

import Byline
import Control.Monad

main :: IO ()
main =
  void $
    runBylineT $ 
      sayLn ("Hello!" <> fg red)
  
