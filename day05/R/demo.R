library("animation")
library("scatterplot3d")

## ---- matrices ------
D = matrix(c(0.4, -0.8, 0,
             0.8, 0.4, 0,
             0,    0,   0.94), 
           byrow = TRUE, nrow = 3)
V = matrix(c(-0.626453810742332, 0.183643324222082, -0.835628612410047, 
             1.59528080213779, 0.329507771815361, -0.820468384118015, 
             0.487429052428485, 0.738324705129217, 0.575781351653492), nrow = 3)
A = V %*% D %*% solve(V)


## ---- animation ------

ani.options('convert')
simulate_linsys = function(A, nperiod = 50) {
  x0 = c(700, 700, 700)
  out = matrix(0, nperiod + 1, length(x0))
  out[1, ] = x0
  for (i in seq_len(nperiod)) {
    out[i + 1, ] = A %*% out[i, ]
  }
  
  xlim = c(min(out[, 1]), max(out[, 1]))
  ylim = c(min(out[, 2]), max(out[, 2]))
  zlim = c(min(out[, 3]), max(out[, 3]))
  for (i in seq_len(nperiod)) {
    if (i == 1) {
      data = t(out[1:i, ])
    } else {
      data = out[1:i, ]
    }
    scatterplot3d(data, angle = 25, type="l",
                  xlim = xlim, ylim = ylim, zlim = zlim)
  }
}

animation:::saveMovie(simulate_linsys(A, 50),
  movie.name = 'day05/image/linsys.gif',
  interval = 0.4, nmax = 50, ani.width = 600
)

