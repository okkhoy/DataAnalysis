if(x > 3) {
  y1 <- 10
} else {
  y1 <-0
}

y2 <- if(x > 3) {
  10
} else {
  0
}

for (i in 1:10) {
  print(i)
}

x <- c("a", "b", "c", "d")
for (i in 1:4) {
  print(x[i])
}

for (i in seq_along(x)) {
  print(x[i])
}

for (letter in x) {
  print (letter)
}

for (i in 10:1) {
  print(i)
}


count <- 0

while( count < 10) {
  print(count)
  count <- count + 2
}

z <- 5

while(z > 3 && z < 10) {
  print (z)
  
  coin <- rbinom(1,1,0.5)
  
  if (coing == 1) {
    z <-Z +1
  } else {
    z <- Z -1
  }
}