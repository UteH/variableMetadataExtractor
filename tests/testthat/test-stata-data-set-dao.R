context("Stata Data Set")

modules::import("../../R/daos/stata/StataDataSetDao", attach = TRUE)

ds3_dao <- NULL

setup({
  ds3_dao <<- StataDataSetDao$new(here("data-raw/stata/ds3.dta"))
})

teardown({
  ds3_dao <<- NULL
})

test_that("total absolute frequency is correct", {
  distribution <- ds3_dao$get_distribution(
    "adem01a",
    scale_level_en = "nominal", access_ways = c("hurz")
  )
  expect_identical(distribution$get_total_absolute_frequency(), unbox(1622))
})
