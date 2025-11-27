# --- FORCED CONFIG BY LEADER ---

# 1. Build thư viện lõi (LibXpdf)
# Lấy tất cả file .cc trong thư mục này trừ các file main của tool
file(GLOB SOURCES "*.cc")
list(REMOVE_ITEM SOURCES 
  "${CMAKE_CURRENT_SOURCE_DIR}/pdftotext.cc"
  "${CMAKE_CURRENT_SOURCE_DIR}/pdftopng.cc"
  "${CMAKE_CURRENT_SOURCE_DIR}/pdfinfo.cc"
  "${CMAKE_CURRENT_SOURCE_DIR}/pdffonts.cc"
  "${CMAKE_CURRENT_SOURCE_DIR}/pdfdetach.cc"
  "${CMAKE_CURRENT_SOURCE_DIR}/pdftoppm.cc"
  "${CMAKE_CURRENT_SOURCE_DIR}/pdftohtml.cc"
  "${CMAKE_CURRENT_SOURCE_DIR}/pdftops.cc"
  "${CMAKE_CURRENT_SOURCE_DIR}/pdfimages.cc"
)

add_library(xpdf ${SOURCES})

# 2. Build Tool: PDFTOTEXT (Mục tiêu số 1)
add_executable(pdftotext pdftotext.cc)
target_link_libraries(pdftotext xpdf goo fofi splash ${FREETYPE_LIBRARY} ${PNG_LIBRARY} ${ZLIB_LIBRARY})

# 3. Build Tool: PDFINFO (Mục tiêu phụ)
add_executable(pdfinfo pdfinfo.cc)
target_link_libraries(pdfinfo xpdf goo fofi splash ${FREETYPE_LIBRARY} ${PNG_LIBRARY} ${ZLIB_LIBRARY})

# 4. Build Tool: PDFTOPNG
add_executable(pdftopng pdftopng.cc)
target_link_libraries(pdftopng xpdf goo fofi splash ${FREETYPE_LIBRARY} ${PNG_LIBRARY} ${ZLIB_LIBRARY})

# --- END FORCED CONFIG ---
