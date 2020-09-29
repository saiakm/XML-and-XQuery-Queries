let $global:= for $x in doc('db/books.xml')//book
group by $n:=$x/title
return <output>{$x}</output>

let $global_avg := avg(for $x in $global
return $x/book[1]/price)

let $cate := for $x in $global
let $y := $x/book[1]
group by $cat := $y/category
return <x>{$y}</x>

let $avg_cat := for $x in $cate
let $avg := avg($x/book/price)
return <avg>{$avg}{$x/book[1]/category}</avg>


let $max_cat := for $x in $cate
let $y := max($x/book/price)
return <max><price>{$y}</price>{$x/book[1]/category}</max>

let $high_books := for $x in $cate/book
for $y in $max_cat
where $x/price = $y/price and $x/category = $y/category
return $x

for $x in $high_books
for $y at $i in doc('db/books.xml')/biblio/author
where $x[category = "DB" or category = "Others"] and $y/book/title = $x/title
group by $cat := $x/category
return <result><categories><output>{$x/category}{$x/title}{$x/price}{$y/name}</output></categories></result>


