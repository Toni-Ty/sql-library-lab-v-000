def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title AS book_title, books.year AS book_year FROM books
    INNER JOIN series
      ON books.series_id = series.id
    WHERE series.id = 1
    ORDER BY books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto FROM characters
    ORDER BY length(motto) DESC
    LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS popular_species FROM characters
    GROUP BY species
    ORDER BY popular_species DESC
    LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name AS author_name, subgenres.name AS subgenre_name FROM series
    INNER JOIN authors
      ON series.author_id = authors.id
    INNER JOIN subgenres
      ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series
    JOIN books
    ON books.series_id = series.id
   JOIN character_books
    ON character_books.book_id = books.id
   JOIN characters
    ON character_books.character_id = characters.id
   WHERE characters.species = 'human'
   GROUP BY series.title
   ORDER BY COUNT(*) DESC
   LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(books.title) FROM characters
  JOIN character_books ON characters.id = character_books.character_id
  JOIN books ON books.id = character_books.book_id
  GROUP BY characters.name
  ORDER BY COUNT(books.title) DESC"
end
