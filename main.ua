# Experimental!

I ~ "git:https://github.com/Marcos-cat/iris" ~ Color Draw Key Mouse T Window
Cat ~ "./catppuccin.ua"

Side         ← 500
Pad          ← 20
OutlineGirth ← 15
SolvedState  ← ⍉↯4_4 ⊂⍚°⋕+1⇡15 □" "

CellSide       ← -×₂Pad ÷4 Side
IndToPos       ← +Pad+÷₂CellSide ×Side ÷4 # The _centered_ position
CurrHoleCoords ← ⊢⊚ ≡₀(≍□" ")             # Coords ? Grid
WhoIsHovered ← |0 (
  # Coords/`1 ?
  S ← ˜÷Pad ÷₄Side
  HF ← ÷₂-×₂Pad÷₄Side
  °IndToPos ⊟°ℂ Mouse~Pos
  ⍥⋅¯1 ⊃(⋅0 /× <S ⌵-⊸⁅|⁅)
)
DrawState ← |1.0 (
  ⊃(Draw~Text!°⊸Centered 1 Cat~Text CellSide (IndToPos ⇡4_4)
  | Draw~Square!°⊸Centered 1 Cat~Surface₀ CellSide (IndToPos ⍜∩♭₋₁× ⊙(⇡4_4) ≡₀(¬≍□" "))
  )
)
DrawSelected ← |1.0 (
  ⊟ °⊟ # Errors if input is scalar (i.e. nothing selected)
  Draw~Square!°⊸Centered1 Cat~Yellow +OutlineGirth CellSide IndToPos
)
DrawHovered ← |0.0 (
  Draw~Square!°⊸Centered 1 Cat~Green +×1.3OutlineGirth CellSide IndToPos WhoIsHovered
)

# HandleClick ← |2.2 ⍥(
#  ⍣(⊙(⊟°⊟)
#   # Something was selected
#  | # Nothing was selected
#   Mouse~Pos
#  )
# ) Mouse~Pressed 0

# Stack is: the grid of numbers, then either `1 or a two-array
# showing indices of the currenly selected cell

I~Open [Side Side] "Fifteen"
SolvedState [1 1]
°Window~FPS 60
I~Loop!(
  I~Draw~Background Cat~Base
  DrawHovered
  ◡⊓(DrawState|⍣DrawSelected)
)
