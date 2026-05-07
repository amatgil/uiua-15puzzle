# Experimental!

I ~ "git:https://github.com/Marcos-cat/iris" ~ Color Draw Key T Window
Cat ~ "./catppuccin.ua"
Side ← 500
Pad  ← 20
I~Open [Side Side] "Fifteen"
St ← ↯4_4 ⊂⍚°⋕+1⇡15 □" "

CellSide ← -×2Pad ÷4 Side
DrawState ← |1.0 (
  ⊃(Draw~Text!°⊸Centered 1 Cat~Text CellSide (+Pad+÷₂CellSide ×Side ÷4 ⇡4_4)
  | Draw~Rect Cat~Surface₀ CellSide (+Pad ×Side ÷4 ⍜∩♭₋₁× ⊙(⇡4_4) ≡₀(¬≍□" "))
  )
)

St
°Window~FPS 60
I~Loop!(
  I~Draw~Background Cat~Base
  ⊸DrawState
)
