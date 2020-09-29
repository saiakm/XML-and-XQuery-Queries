let $books:= for $x in doc('db/books.xml')//book
group by $n:=$x/title
return $x[1]

for $x in $books
order by  $x/rating descending
return ($x/title, $x/rating)