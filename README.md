# cis194

Homework solutions for UPenn's CIS 194:

http://acruikshank.github.io/cis194/lectures.html

## Installation

On a mac:

    brew install haskell-stack
    cd cis194
    stack setup
    stack test

## How to run tests

```
stack test
```

## Run a single test file

```
stack runghc -- -isrc -itest test/Cis194/Hw/SomeSpec.hs
```

## Using QuickCheck in ghci

    :m +Test.QuickCheck
    :l src/Cis194/Hw/Week1.hs 

    -- define a fx that generates data
    let negInts = choose(-10000000, -1)

    -- define a Property that runs function and asserts something about result
    let toDigitsEmpty x = (toDigits x) == []

    -- run QuickCheck to validate property
    quickCheck (forAll negInts toDigitsEmpty)
