let $q:= for $x at $i in doc('db/books.xml')/biblio/author
for $y at $j in doc('db/books.xml')/biblio/author[position()>$i]/book
where $x/book = $y 
return <output>{$x/name}{$y/preceding-sibling::name}{$y}</output>


for $a at $i in $q
where $q[$i]/name[1] = $q[$i+1]/name[1] and $q[$i]/name[2] = $q[$i+1]/name[2]
let $b := $q[i-1]
return if ($q[$i]/name[1] = $b/name[1] and $q[$i]/name[2] = $b/name[2])
       then $q[$i+1]
       else <coauthor>{$q[$i]}{$q[$i+1]}</coauthor>