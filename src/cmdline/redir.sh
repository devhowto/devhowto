#!/bin/bash

error () {
  printf "Oops!\n"
  exit 1
}

>&2 error
