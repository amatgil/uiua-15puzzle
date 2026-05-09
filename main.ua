# Experimental!

I ~ "git:https://github.com/Marcos-cat/iris" ~ Color Draw Key Mouse T Window
Cat ~ "./catppuccin.ua"

Side         ← 500
Pad          ← 20
OutlineGirth ← 6
SolvedState  ← ⍉↯4_4 ⊂⍚°⋕+1⇡15 □" "
Tipografia   ← "Uiua386.ttf"

CellSide ← -×₂Pad ÷₄ Side
IndToPos ← +Pad+÷₂CellSide ×Side ÷₄ # The _centered_ position
HoleInd  ← ⊢⊚ ≡₀(≍□" ")             # Coords ? Grid
WhoIsHovered ← |0 (
  # Coords/`1 ?
  S ← ˜÷Pad ÷₄Side
  HF ← ÷₂-×₂Pad÷₄Side
  ⁅ °IndToPos ⊟°ℂ Mouse~Pos
)

DrawState ← |1.0 (
  ⊃(Draw~Text!(°⊸Centered1 °⊸Font Tipografia) Cat~Text CellSide (IndToPos ⇡4_4)
  | Draw~Square!°⊸Centered 1 Cat~Surface₀ CellSide (IndToPos ˜(▽¬⊸∊¤)/⊂⇡4_4 HoleInd)
  | Draw~Square!°⊸Centered 1 Cat~Surface₁ CellSide (IndToPos HoleInd)
  )
)
DrawSelected ← |1.0 (
  ⊟°⊟ # Assert [2]
  ¬≍WhoIsHovered ⊸HoleInd
  ⍥(Draw~Square!°⊸Centered1 Cat~Yellow +OutlineGirth CellSide IndToPos)
)
DrawHovered ← |0.0 (
  Draw~Square!°⊸Centered 1 Cat~Green +×2OutlineGirth CellSide IndToPos WhoIsHovered
)
HandleClick ← |2.2 (
  # grid selection ? grid selection
  MoveHole ← |2.2 (
    # Grid ¯1 ? Grid OldSel
    ⊙⊟ ⟜HoleInd
    ⊙(◡(⍤"Invalid move" ∊A₂/-))
    # ⊙(◡(⍤"Invalid move" ∊A₂/-) ⊟⟜HoleInd)
    ⊙¯1 ˜⍜⊡⇌
  )
  HandleNormalClick ← |2.2 ⊙⋅WhoIsHovered
  HandleHoleClick ← |2.2 ⍣(⍩MoveHole ⊙(⊟°⊟))∘

  ⍥(⨬(HandleNormalClick|HandleHoleClick)⊸(≍WhoIsHovered HoleInd)) Mouse~Down0
)

# Stack is: the grid of numbers, then either `1 or a two-array
# showing indices of the currenly selected cell

I~Open [Side Side] "Fifteen"
SolvedState [1 1]
°Window~FPS 60
I~Loop!(
  I~Draw~Background Cat~Base
  DrawHovered
  ◡⊓(DrawState|⍣DrawSelected)
  ⍣HandleClick(&p"Invalid move")
)
