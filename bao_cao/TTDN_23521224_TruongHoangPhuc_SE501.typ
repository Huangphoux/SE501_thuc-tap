#set text(font: "Times New Roman", size: 13pt, lang: "vi")

#include "000_mo-dau/trang_bia.typ"

#set page(margin: (top: 3cm, bottom: 3.5cm, left: 3.5cm, right: 2cm))
// leading: giữa các dòng; spacing: giữa các đoạn văn
#set par(leading: 0.9em, spacing: 1.5em, first-line-indent: 0pt, justify: true)
#set list(marker: [-], indent: 1em)
#show heading: set block(above: 1.4em, below: 1em)

#show heading.where(level: 1): it => {
  pagebreak(weak: false) // Heading 1 nằm trên trang riêng
  let count = counter(heading).get().at(0)
  align(center, if count > 0 and count < 6 {
    // Thêm chữ Chương vào Heading 1 trên trang riêng
    ("Chương " + counter(heading).display("1. ") + it.body)
  } else { it.body })
}

// padding for table
#set table(inset: 7pt)
// header căn giữa
#show table.cell.where(y: 0): it => table.cell(align: center, inset: 12pt)[#text(
  weight: "bold",
  it.body,
)]
// giảm line spacing trong bảng
#show table: set par(leading: 0.5em)
// table can be split into next page
#show figure.where(kind: table): set block(breakable: true)
// figure numbering by chapter
#set figure(numbering: (..num) => numbering("1.1", counter(heading).get().first(), num.pos().first()))
// caption của bảng nằm trên, còn lại nằm dưới
#show figure.where(
  kind: table,
): set figure.caption(position: top)
// in nghiêng (italic) chú thích
#show figure.caption: set text(style: "italic")

#let h1 = (
  [GIỚI THIỆU CÔNG TY THỰC TẬP],
  [NỘI DUNG THỰC TẬP],
  [TỔNG KẾT],
  [TÀI LIỆU THAM KHẢO],
)

#let irregular = (
  [TÓM TẮT ĐỒ ÁN],
  [TÀI LIỆU THAM KHẢO],
  [PHỤ LỤC],
)

// thêm chữ Chapter cho Heading 1
#show outline.entry.where(level: 1): it => {
  text(
    weight: if it.element.body in h1 { "bold" } else { "regular" },
    link(
      // in đậm heading 1 trong mục lục
      it.element.location(),
      it.indented(
        if it.element.body in h1 and it.element.body not in irregular {
          "Chương " + it.prefix()
        } else if it.element.body in h1 and it.element.body in irregular {} else { it.prefix() + ":" },
        it.inner(),
      ),
    ),
  )
}

// #show outline.entry.where(level: 1): it => {
//   if it.element.func() == heading {
//     text(
//       weight: "bold",
//       link(
//         // in đậm heading 1 trong mục lục
//         it.element.location(),
//         it.indented(
//           "Chương " + it.prefix(),
//           it.inner(),
//         ),
//       ),
//     )
//   } else {
//     it
//   }
// }

#heading(outlined: false, "LỜI MỞ ĐẦU")
#include "000_mo-dau/loi_mo_dau.typ"

#heading(outlined: false, "LỜI CẢM ƠN")
#include "000_mo-dau/loi_cam_on.typ"

#align(center, outline(title: "MỤC LỤC", indent: 2em))
#align(center, outline(title: "DANH MỤC HÌNH", target: figure.where(kind: image)))
#align(center, outline(title: "DANH MỤC BẢNG", target: figure.where(kind: table)))

#set page(numbering: "1")
#counter(page).update(1)

#show link: it => underline(text(fill: blue)[#it])

#set heading(numbering: "1.")

= GIỚI THIỆU CÔNG TY THỰC TẬP
== Giới thiệu […]
#include "100_gioi-thieu/gioi-thieu.typ"
== Sản phẩm công ti
#include "100_gioi-thieu/san-pham.typ"
== Lịch làm việc khi thực tập tại công ti
#include "100_gioi-thieu/lich-lam-viec.typ"

= NỘI DUNG THỰC TẬP
== Tìm hiểu công ti và các kĩ năng cơ bản trong công ti
#include "200_noi-dung/tim-hieu.typ"
== Nghiên cứu kĩ thuật
#include "200_noi-dung/nghien-cuu.typ"
== Thực hiện dự án cá nhân
#include "200_noi-dung/ca-nhan.typ"
== Tham gia dự án thực tế
#include "200_noi-dung/thuc-te.typ"

= TỔNG KẾT
#include "300_tong-ket/tong-ket.typ"
== Điểm mạnh
#include "300_tong-ket/diem-manh.typ"
== Điểm yếu
#include "300_tong-ket/diem-yeu.typ"
== Kết quả đạt được
=== Kiến thức
#include "300_tong-ket/ket-qua/kien-thuc.typ"
=== Kĩ năng
#include "300_tong-ket/ket-qua/ki-nang.typ"
=== Khác
#include "300_tong-ket/ket-qua/khac.typ"
=== Định hướng tiếp theo sau khi thực tập
#include "300_tong-ket/ket-qua/dinh-huong.typ"

= TÀI LIỆU THAM KHẢO
#bibliography(title: none, "bib.bib")
