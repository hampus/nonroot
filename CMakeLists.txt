cmake_minimum_required(VERSION 2.8)
project(nonroot C) 

add_executable(nonroot nonroot.c)

install(TARGETS nonroot DESTINATION bin)
