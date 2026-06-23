#import "@preview/clean-math-paper:0.2.7": *

// #let date = datetime.today().display("[month repr:long] [day], [year]")
#let date = []

// Modify some arguments, which can be overwritten in the template call
#page-args.insert("numbering", "1/1")
#text-args-title.insert("size", 2em)
#text-args-title.insert("fill", black)
#text-args-authors.insert("size", 12pt)

// #set page(fill: )
// #set text(fill: green.darken(84%))
// #set page(fill: rgb("faf9f0"))

#show: template.with(
  title: "Infinitude dos Primos: Uma Prova Topológica",
  authors: (
    (name: "Arthur Trindade da Silva"),
    (name: "Brian Matheus Rodrigues Ribeiro"),
    (name: "Giovanna Silva Cavalcante")
  ),
  date: date,
  heading-color: rgb("#0404e7"),
  link-color: rgb("#008002"),
  // Insert your abstract after the colon, wrapped in brackets.
  // Example: `abstract: [This is my abstract...]`
//   abstract: [*Inserir o abstract*],
//   keywords: ("First keyword", "Second keyword", "etc."),
  // Pass page-args to change page settings
  // page-args: page-args,
  // Pass text-args-authors to change author name text settings
  // text-args-authors: text-args-authors,
  // Pass text-args-title to change title text settings
  // text-args-title: text-args-title,
)

#let Nab = $N_(a, b)$

= Introdução
// #lorem(20)

= Metodologia

== Topologia
#definition(title: "Topologia")[
Uma topologia sobre um conjunto $X$ é uma coleção $tau$ subconjuntos de $X$
que satisfaz as seguintes propriedades:

1. $emptyset$ e $X$ pertencem a $tau$;
2. A união dos elementos de qualquer subcoleção de $tau$ pertence a $tau$;
3. A interseção dos elementos de uma subcoleção finita de $tau$ pertence a $tau$.

- Um conjunto $X$ equipado com uma topologia $tau$ é chamado de *espaço topológico*.
- Um subconjunto $U$ de um espaço topológico $X$, que pertence à coleção $tau$, é chamado de *conjunto aberto de* de $X$.

]

== Argumento Topológico de Furstenberg

#example[
    Considere os conjuntos $X = bb(Z)$ e $N_(a, b) = {a + n dot b | n in bb(Z)}
    a, b in bb(Z)$, em que $b > 0$. Um conjunto $O subset.eq bb(Z)$ é chamado aberto
    se, e somente se, $O = emptyset$ ou, para todo $a in O$, existe um inteiro $b > 0$ tal que $N_(a, b) subset.eq O$.
]

$bold("A coleção") tau bold("induzida pelos conjuntos abertos do tipo") O, bold("é uma topologia sobre") bb(Z)$:

1. $emptyset$ e $bb(Z)$ pertencem a $tau$;
#proof[
    - Se $O = emptyset$. Imediato pela definição. 
    - Se $O = bb(Z)$. Queremos verificar que $Nab subset.eq bb(Z)$. É fácil ver que para todo $a in bb(Z), exists b> 0$ t.q $Nab subset.eq bb(Z)$. Tome $b = 1$, por exemplo.

]

2. Pela definição dos elementos de $tau$, a união arbitrária de subconjuntos de $tau$ pertence a $tau$;

#proof[
  Seja $ A subset.eq tau$ e $Y = union.big O_alpha, O_alpha in A$
  - Se $Y = emptyset in tau$.
  - Se $Y != emptyset$. Temos que $exists a in Y$, logo $a in O_alpha$. Como $O_alpha in tau$, então $forall a in O_alpha, exists b > 0$. t.q. $Nab subset.eq O_alpha$. Portanto, $Nab subset.eq Y$.
]

3. Se $O_1$ e $0_2$ pertencem a $tau$, então $O_1 inter O_2$ pertence a $tau$.

#proof[
  Seja $O_1 e O_2 in tau$,
  - Se $O_1 = emptyset$ e $O_2 = emptyset$, temos $O_1 inter O_2 = emptyset in tau$

  - Se $O_1 = emptyset "e" O_2 != emptyset$, sem perda de generalidade. Temos que, $O_1 inter O_2 = emptyset in tau$.
  // 
  - Se $O_1 != emptyset "e" O_2 != emptyset$, temos que:
    - $O_1 in tau, forall a in O_1, space exists b_1 "t.q." N_(a, b_1) subset.eq O_1$
    - $O_2 in tau, space forall a in O_2, exists b_2 "t.q." N_(a, b_2) subset.eq O_2$
    Tome $b = b_1b_2$. Logo, $Nab subset.eq O_1 "e" Nab subset.eq O_2$. Portanto, $Nab subset.eq (O_1 inter O_2)$.

]

= Resultados

= Conclusão

// = Equations

// The template uses #link("https://typst.app/universe/package/i-figured/")[`i-figured`] for labeling equations. Equations will be numbered only if they are labelled. Here is an equation with a label:

// We can reference it by `@eq:label` like this: @eq:equation, i.e., we need to prepend the label with `eq:`. The number of an equation is determined by the section it is in, i.e. the first digit is the section number and the second digit is the equation number within that section.

// Here is an equation without a label:

// $
//   exp(x) = sum_(n=0)^oo (x^n) / n!
// $

// As we can see, it is not numbered.

// = Theorems

// The template uses #link("https://typst.app/universe/package/great-theorems/")[`great-theorems`] for theorems. Here is an example of a theorem:

// #theorem(title: "Example Theorem")[
//   This is an example theorem.
// ]<th:example>
// #proof[
//   This is the proof of the example theorem.
// ]


// We also provide `definition`, `lemma`, `remark`, `example`, and `question`s among others. Here is an example of a definition:

// #definition(title: "Example Definition")[
//   This is an example definition.
// ]

// #question(title: "Custom mathblock?")[
//   How do you define a custom mathblock?
// ]

// #let answer = my-mathblock(
//   blocktitle: "Answer",
//   bodyfmt: text.with(style: "italic"),
// )

// #answer[
//   You can define a custom mathblock like this:
//   ```typst
//   #let answer = my-mathblock(
//     blocktitle: "Answer",
//     bodyfmt: text.with(style: "italic"),
//   )
//   ```
// ]

// Similar as for the equations, the numbering of the theorems is determined by the section they are in. We can reference theorems by `@label` like this: @th:example.

// To get a bibliography, we also add a citation @Cooley65.

// #lorem(50)

// #bibliography("bibliography.bib")

// // Create appendix section
// #show: appendices
// =

// If you have appendices, you can add them after `#show: appendices`. The appendices are started with an empty heading `=` and will be numbered alphabetically. Any appendix can also have different subsections.

// == Appendix section

// #lorem(100)
