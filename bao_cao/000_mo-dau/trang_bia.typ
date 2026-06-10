#set par(leading: 1em, spacing: 0.55em, first-line-indent: 0pt, justify: true)

#let content = [
  #align(center)[
    #text(size: 14pt, weight: "bold")[
      #smallcaps[ĐẠI HỌC QUỐC GIA TP. HỒ CHÍ MINH] \
      #smallcaps[TRƯỜNG ĐẠI HỌC CÔNG NGHỆ THÔNG TIN] \
    ]

    #v(1fr)

    #image("logo-uit.png", width: 30%)


    #v(0.5fr)

    #text(size: 20pt, weight: "bold")[
      BÁO CÁO THỰC TẬP DOANH NGHIỆP\
      [VỊ TRÍ THỰC TẬP]
    ]

    #v(1fr)

    #{
      show table.cell: set text(size: 16pt)

      table(
        columns: 2,
        align: (left, left),
        stroke: none,
        [Công ti thực tập:], [[Công ti thực tập]],
        [Người phụ trách:], [[Mentor]],
        [Thực tập sinh:], [Trương Hoàng Phúc],
      )
    }

    #v(2fr)

    #text(size: 14pt, weight: "bold")[
      TP. HỒ CHÍ MINH, NĂM 2026
    ]
  ]]


#block(stroke: 2pt + black, inset: 1em, outset: 2.6em)[
  #block(stroke: 8pt + black, inset: 1em, outset: 3em)[
    #block(stroke: 2pt + black, inset: 1em, outset: 3.4em)[
      #content
    ]
  ]
]
