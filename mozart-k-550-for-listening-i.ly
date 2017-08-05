\version "2.18.2"

\include "functions.ily"

\header {
  tagline = ##f
}

#(set! paper-alist (cons '("my size" . (cons (* 8.5 in) (* 2.5 in))) paper-alist))

\paper {
  #(set-paper-size "my size" )
  print-page-number = ##f
  max-systems-per-page = #1
}

\layout {
  indent = 0 \in
  \context {
    \Score
    %\remove "Bar_number_engraver"
  }
}

\paper {
  ragged-last-bottom = ##f
  ragged-bottom = ##f
}

main = \relative c'' {
  \clef treble
  \key g \minor
  \time 2/2

  \tempo "Molto Allegro"
  <<
    {
      r2 r4 es8 ^\markup \column {
        \line \huge \bold { P\super{1}}
        \line \italic { violins }
      } (d)
      d4 es8 (d) d4 es8 (d) |
    }
    \new Staff {
      \key g \minor  g,,8 \p ^\markup \italic "violas" g es' es g, g es' es  |
      \once \override TextScript #'Y-offset = #-1.0
      \stopStaff s1 ^\markup \italic "etc."
    }
  >>


  d'4 (bes') r bes8 (a) |
  g4 g8 (f) es4 es8 (d) |
  c4 c r d8 (c) |

  %measure 6
  c4 d8 (c) c4 d8 (c) |
  c4 (a') r a8 (g) |
  fis4 fis8 (es) d4 d8 (c) |
  bes4 bes r bes'8 (a) |
  a4 (c fis, a) |
  g (d) r bes'8 (a) |
  a4 (c fis, a) |
  g4 (bes a8 g f es) |


  %measure 14
  <<
    \new Staff \with {
      \remove Time_signature_engraver
      alignAboveContext = #"main"
    }
    {
      \key g \minor
      \clef "treble"

      r4 fis \p ^\markup \italic "woodwinds" (g a
      bes c8 bes a4 g fis) r cis'2 \f
      (d4) r cis2
      (d4) r cis2
      (d4) cis-! d-! cis-! |
      d2 \clef bass c,, \p ^\markup \italic "bassoon"
      (bes2 a)
    }
    {

      d'1 (cis1 d2)
      r4 d,8 \f d |

      %measure 17
      d2 r4 d8 d |
      d2 r4 d8 d |
      d4 d8 d d4 d8 d |
      d2 r4 es'8 \p (d) |
      d4 es8 (d) d4 es8 (d) |
    }
  >>



  %measure 22
  d4 (bes') r bes8 (a) |
  g4 g8 (f) es4 es8 (d) |
  c4 c r f8 (es) |
  es4 f8 (es) es4 f8 (es) |
  es4 (c') r c8 (bes) |

  %measure 27
  a4 a8 (g) f4 f8 (es) |
  bes'1 \f ^\markup \column { \line \huge { \bold { P \super 2 } } \line { \italic "[full orchestra plays here]" } }|
  f2. r8 f |
  es4-! g-! bes-! r |
  d,-! f-! bes-! r8 d, |

  %measure 32
  c4-! es-! g-! c,-! |
  bes-! d-! f-! r8 f |
  \repeat unfold 3 { e8 f g a bes c des f, }

  %measure 37
  e f g a bes c des e, |
  f2 c'4-! a-! |
  des2 e,4-! g-! |
  f2 c'8 a c a |
  des bes des bes e, g e g |
  f4 r f, r \break |

  %measure 43
  \once \override MultiMeasureRestNumber #'text = #"1"
  R1 * 1

  <<
    \new Staff \with {
      \remove Time_signature_engraver
      alignAboveContext = #"main"
    }
    {

      \key g \minor
      R1
      es'2. \p ^\markup \italic "woodwinds" (f16 es d c
      bes4) r r2 |
      R1 * 4

      bes8 ^\markup \italic "woodwinds" (a c bes d c es d) |
      f2. (e4
      es) r r2 |
      r4 bes-. bes (c) |
      d4. (es8) c4-. r |
      g'2. (fis4 |
      f e es d) |
      r4 ^\markup \italic "flute" g2 (aes4) |
      \repeat unfold 3 { r4 g2 (aes4) }
    }
    {
      f2. \p ^\markup \italic "strings" (e4
      es!4) r4 r2 |
      r4 bes-. bes (c) |
      d4. (es8) c4-. r |
      g'2. (fis4 |
      f! e es d) |
      c (es2 a,4) |
      bes4 r r2 |
      R1
      es2. (f16 es d c
      bes4) r r2 |
      R1
      g2. (fis4 |
      f e es d) |
      \repeat unfold 4 { des2. (c4) }
    }
  >>

  % measure 61
  des8 des' des des \crescTextCresc des \< des des des |
  des des' des des des des des des |
  d!1 \f
  a2.. \trill (g16 a) |
  bes4 d,,8 \sf d d d es es |
  e e f f fis fis g g |
  aes4 r8. aes16 g4 r8. g16 |
  es'4 r8. es16 d4 r8. d16 |
  g2 ~ g8 f-. \p es-. d-. |
  c-. bes-. a-. g-. f-. es-. d-. c-. \break |


  <<
    {
      bes4 r <<
        \colorVoice #magenta {
          \shiftTextScriptHorizontal #2.0
          bes''2 ^\p ^\markup \italic "violins" ~ bes2 (a)
          \override Rest #'color = #black
          b,2\rest bes'2 ~ bes (a)
        } \\
        \colorVoice #blue {
          r4
          \shiftTextScriptHorizontal #2.0
          g8 _\markup \italic "clarinet" \p (f) f4-. g8 (f) f4-. s |
          s2 r4 g8 (f) f4-. g8 (f) f4-. s
        }
      >>
      r2 r4 es'8 \f (d) \break |
    }
    \new Staff \with {
      \remove Time_signature_engraver
    }
    {
      \clef bass
      \key g \minor
      s1 |
      r2  <<
        \colorVoice #blue {
          r4
          \shiftTextScriptHorizontal #2.0
          g,,8 ^\p ^\markup \italic "bassoon" (f) f4-. g8 (f) f4-. s
          s2 r4 g8 (f) f4-. g8 (f) f4-. s
        } \\
        \colorVoice #magenta {
          \shiftTextScriptHorizontal #2.0
          es,2 \p _\markup \italic { violas & cellos } ~
          es (d4) \override Rest #'color = #black d\rest |
          d2\rest es ~
          es (d4) d\rest |
        }
      >>
    }
  >>

  %measure 77
  d'''4 es8 (d) d4 es8 (d) |
  d2 es4. (c8) |
  bes4. (d8) c4. (a8) |
  bes4 r r2

  <<


    \colorVoice #magenta {

      \override Rest #'color = #black
      bes,2\rest
      \shiftTextScriptHorizontal #2.0
      es'2 ^\p ^\markup \italic "violins"
      ~ es (d4) bes,\rest
    } \\
    \colorVoice #blue {
      s2 r4
      \shiftTextScriptHorizontal #2.0
      g'8 _\p _\markup \italic "clarinet" (f)
      f4-. g8 (f) f4-. s4
    }


  >>

}

\score {
  <<
    \new Staff = "main" \with {
      midiInstrument = "string ensemble 2"
    } \main
  >>

  \layout { }
  \midi {
    \tempo 2=92
  }
}
