# Experimental!

I ~ "git:https://github.com/Marcos-cat/iris" ~ Color Draw Key T Window
Cat ~ "./catppuccin.ua"
Side ← 500
Pad  ← 20
I~Open [Side Side] "Fifteen"
SolvedState ← ⍉↯4_4 ⊂⍚°⋕+1⇡15 □" "

CellSide     ← -×₂Pad ÷4 Side
IndToTextPos ← +Pad+÷₂CellSide ×Side ÷4
DrawState ← |1.0 (
  ⊃(Draw~Text!°⊸Centered 1 Cat~Text CellSide (IndToTextPos ⇡4_4)
  | Draw~Square Cat~Surface₀ CellSide (+Pad ×Side ÷4 ⍜∩♭₋₁× ⊙(⇡4_4) ≡₀(¬≍□" "))
  )
)
DrawSelected ← |1.0 ()

# State is: the grid of numbers, then either `1 or a two-array
# showing indices of the currenly selected cell
SolvedState ¯1
°Window~FPS 60
I~Loop!(
  I~Draw~Background Cat~Base
  ◡⊓(DrawState|⍣DrawSelected)
)
