cmake_minimum_required(VERSION 3.13...4.0)

project(pascal-pong LANGUAGES C)

find_program(FPC NAMES fpc ppc${CMAKE_SYTEM_PROCESSOR})
set(INFILE "${CMAKE_CURRENT_SOURCE_DIR}/pong.pas")
set(OUTLIB "${CMAKE_CURRENT_BINARY_DIR}/pong_libretro${CMAKE_SHARED_LIBRARY_SUFFIX}")

add_custom_command(
  OUTPUT ${OUTLIB}
  DEPENDS ${INFILE}
  COMMAND ${FPC} -o${OUTLIB} ${INFILE}
  VERBATIM
)
add_custom_target(build ALL DEPENDS ${OUTLIB})

find_program(RETROARCH NAMES retroarch ludo)
add_custom_target(run COMMAND ${RETROARCH} -L ${OUTLIB} ${INFILE})
