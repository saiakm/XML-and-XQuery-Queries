let $books := for $x in doc('db/books.xml')//book
let $m := ($x/price) div ($x/rating)
order by $x/rating descending
group by $n:= $x/title
return <book>{$x[1]/*}<min>{($m[1])}</min></book>


let $min := for $x in $books
where $x/min = min($books[category = $x/category]/min)
return $x

let $DB_S := for $x in $min[category = 'DB' or category = 'Science']
return $x

let $PL := for $x in $books
where $x/min = min($books[category = 'PL'][min !=  min($books[category = $x/category]/min)]/min)
return $x 

let $O := $books[title = 'Pattern Recognition']
return <books>{$PL}{$O}{$DB_S}</books>



        