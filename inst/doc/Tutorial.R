## ------------------------------------------------------------------------
library("devtools")

# Create a package in the temp directory
description <- list(
  Title = "An Example Package",
  Description = "Demonstrates 'msgtools' functionality",
  BugReports = "https://github.com/RL10N/msgtools/issues",
  License = "Unlimited"
)
pkg_dir <- file.path(tempdir(), "translateme")
dir.create(pkg_dir)
create(pkg_dir, description = description, rstudio = FALSE)

## ------------------------------------------------------------------------
library("msgtools")
(ex <- msgtools:::translatable_messages)
dump("ex", file = file.path(pkg_dir, "R", "fns.R"))

## ------------------------------------------------------------------------
# check that GNU gettext is available (required for msgtools to work)
check_for_gettext()

get_messages(pkg_dir)

## ------------------------------------------------------------------------
use_localization(pkg_dir)

## ------------------------------------------------------------------------
es <- make_translation("es", translator = "Awesome Translator <translator@example.com", pkg = pkg_dir)

## ------------------------------------------------------------------------
write_translation(es, pkg = pkg_dir)

## ------------------------------------------------------------------------
es <- make_translation("es", pkg = pkg_dir)

## ------------------------------------------------------------------------
sync_template(pkg = pkg_dir)
es <- make_translation("es", pkg = pkg_dir)

## ------------------------------------------------------------------------
check_translations(pkg_dir)
install_translations(pkg_dir)

## ------------------------------------------------------------------------
dir(file.path(pkg_dir, "inst", "po"), recursive = TRUE)

## ------------------------------------------------------------------------
spell_check_msgs(pkg = pkg_dir)

## ------------------------------------------------------------------------
get_message_distances(pkg = pkg_dir)

## ---- echo=FALSE---------------------------------------------------------
unlink(pkg_dir, recursive = TRUE)

