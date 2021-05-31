#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
Process, Priority, , High
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Changements dans Emacs seulement (pour taper du LaTeX)

#IfWinActive ahk_class Emacs

; Échanger les apostrophes dans emacs.

<^>!,::
  Send, {SC031}

SC031::
  Send, '

; Lors d’un environement \[\], mettre automatiquement \].
:*b0:\[::\]{left 2}

; Remplacer des caractères unicodes par une commande LaTeX
:*:ℕ::\IN
:*:ℤ::\IZ
:*:ℚ::\IQ
:*:ℝ::\IR
:*:ℂ::\IC
:*:«::\og
:*:»::\fg
:*:⩽::\le
:*:⩾::\ge
:*:∞::\infty
:*:∈::\in
:*:∃::\exists
:*:∀::\forall
:*:∅::\emptyset
:*:⌀::\emptyset
:*:⟦::\lb
:*:⟧::\rb
:*:⟨::\langle
:*:⟩::\rangle
:*:⌊::\lfloor
:*:⌋::\rfloor
:*:⌈::\lceil
:*:⌉::\rceil
:*:∫::\dint
:*:…::\dots
:*:∉::\not\in
:*:∿::\sim
:*:≡::\equiv
:*:⊄::\not\subset
:*:∪::\cup
:*:∩::\cap
:*:∏::\dprod
:*:∑::\dsum
:*:→::\to
:*:←::\leftarrow
:*:⇒::\Rightarrow
:*:⇐::\Leftarrow
:*:⇔::\Leftrightarrow
:*:↦::\mapsto
:*:√::\sqrt
:*:∨::\vee
:*:∧::\wedge
:*:∂::\partial
:*:ℓ::\ell
:*:⊂::\subset
:*:⊕::\oplus
:*:⊗::\otimes
:*:×::\times
:*:⋮::\vdots
#Hotstring c ; Toutes les hotstrings sont maintenant sensibles à la casse.
:*:α::\alpha
:*:β::\beta
:*:γ::\gamma
:*:δ::\delta
:*:ε::\epsilon
:*:​ζ::\zeta
:*:η::\eta
:*:θ::\theta
:*:ι::\iota
:*:λ::\lambda
:*:μ::\mu
:*:ν::\nu
:*:ξ::\xi
:*:ο::\omicron
:*:π::\pi
:*:ρ::\rho
:*:σ::\sigma
:*:τ::\tau
:*:υ::\upsilon
:*:φ::\phi
:*:χ::\chi
:*:ψ::\psi
:*:ω::\omega
:*:Α::\Αlpha
:*:Β::\Beta
:*:Γ::\Gamma
:*:Δ::\Delta
:*:Ε::\Epsilon
:*:​Ζ::\Zeta
:*:Η::\Eta
:*:Θ::\Theta
:*:Ι::\Iota
:*:Λ::\Lambda
:*:Μ::\Mu
:*:Ν::\Nu
:*:Ξ::\Xi
:*:Ο::\Omicron
:*:Π::\Pi
:*:Ρ::\Rho
:*:Σ::\Sigma
:*:Τ::\Tau
:*:Υ::\Upsilon
:*:Φ::\Phi
:*:Χ::\Chi
:*:Ψ::\Psi
:*:Ω::\Omega
#Hotstring c0 ; Toutes les hotstrings sont maintenant insensibles à la casse.
:*:₁::_1
:*:₂::_2
:*:₃::_3
:*:₄::_4
:*:₅::_5
:*:₆::_6
:*:₇::_7
:*:₈::_8
:*:₉::_9
:*:₀::_0
:*:ₐ::_a
:*:ₑ::_e
:*:ₕ::_h
:*:ᵢ::_i
:*:ⱼ::_j
:*:ₖ::_k
:*:ₗ::_l
:*:ₘ::_m
:*:ₙ::_n
:*:ₒ::_o
:*:ₚ::_q
:*:ᵣ::_r
:*:ₛ::_s
:*:ₜ::_t
:*:ᵤ::_u
:*:ᵥ::_v
:*:ₓ::_x
:*:¹::^1
:*:²::^2
:*:³::^3
:*:⁴::^4
:*:⁵::^5
:*:⁶::^6
:*:⁷::^7
:*:⁸::^8
:*:⁹::^9
:*:⁰::^0
:*:ᵃ::^a
:*:ᵇ::^b
:*:ᶜ::^c
:*:ᵈ::^d
:*:ᵉ::^e
:*:ᶠ::^f
:*:ᵍ::^g
:*:ʰ::^h
:*:ⁱ::^i
:*:ʲ::^j
:*:ᵏ::^k
:*:ˡ::^l
:*:ᵐ::^m
:*:ⁿ::^n
:*:ᵒ::^o
:*:ᵖ::^p
:*:ʳ::^r
:*:ˢ::^s
:*:ᵗ::^t
:*:ᵘ::^u
:*:ᵛ::^v
:*:ʷ::^w
:*:ˣ::^x
:*:ʸ::^y
:*:ᶻ::^z

#IfWinActive