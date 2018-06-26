require 'csv'

categories_data = CSV.open('./db/data/categories.csv', headers: true, header_converters: :symbol)

tags_data = CSV.open('./db/data/tags.csv', headers: true, header_converters: :symbol)

questions_data = CSV.open('./db/data/questions.csv', headers: true, header_converters: :symbol)

options_data = CSV.open('./db/data/options.csv', headers: true, header_converters: :symbol)

sections = ["Demographic", "Clinical", "Exposure"]

QuestionnaireQuestion.destroy_all
Intake.destroy_all
Option.destroy_all
Tagging.destroy_all
Tag.destroy_all
Category.destroy_all
Question.destroy_all
Section.destroy_all
MenuItem.destroy_all
Questionnaire.destroy_all
User.destroy_all

def seed_categories(category_data)
  ActiveRecord::Base.connection.reset_pk_sequence!(:categories)
  category_data.each do |category|
    entity = Category.create!(name: category[:category])
    puts "Created #{entity.name}"
  end
end

def seed_tags(tag_data)
  ActiveRecord::Base.connection.reset_pk_sequence!(:tags)
  tag_data.each do |tag|
    entity = Tag.create!(name: tag[:tag], category_id: tag[:category_id])
    puts "Created #{entity.name}"
  end
end

def seed_sections(sections)
  ActiveRecord::Base.connection.reset_pk_sequence!(:sections)
  sections.each do |section|
    Section.create!(name: section)
  end
end

def seed_questions(question_data)
  ActiveRecord::Base.connection.reset_pk_sequence!(:taggings)
  question_data.each do |question|
    q = Question.create!(id: question[:id],
                    text: question[:question],
                    answers: question[:answers],
                    section_id: question[:category])
    3.times do |i|
      if i == 0
        tags = question[:tag1].split(',') rescue next
        tag_id_1 = tags[0]
        tag_id_2 = tags[1]
        tag_id_3 = tags[2]
        Tagging.create!(tag_id: tag_id_1, question_id: q.id, classification: 1)
        Tagging.create!(tag_id: tag_id_2, question_id: q.id, classification: 1) rescue next
        Tagging.create!(tag_id: tag_id_3, question_id: q.id, classification: 1) rescue next
      elsif i == 1
        tags = question[:tag2].split(',') rescue next
        tag_id_1 = tags[0]
        tag_id_2 = tags[1]
        tag_id_3 = tags[2]
        Tagging.create!(tag_id: tag_id_1, question_id: q.id, classification: 2)
        Tagging.create!(tag_id: tag_id_2, question_id: q.id, classification: 2) rescue next
        Tagging.create!(tag_id: tag_id_3, question_id: q.id, classification: 2) rescue next
      else
        tags = question[:tag3].split(',') rescue next
        tag_id_1 = tags[0]
        tag_id_2 = tags[1]
        tag_id_3 = tags[2]
        Tagging.create!(tag_id: tag_id_1, question_id: q.id, classification: 3)
        Tagging.create!(tag_id: tag_id_2, question_id: q.id, classification: 3) rescue next
        Tagging.create!(tag_id: tag_id_3, question_id: q.id, classification: 3) rescue next
      end
    end
  end
  puts "Created #{Question.count} questions and #{Tagging.count} taggings"
end

def seed_options(options_data)
  ActiveRecord::Base.connection.reset_pk_sequence!(:options)
  options_data.each do |option|
    entity = Option.create!(name: option[:option], tag_id: option[:tag_id])
    puts "Created #{entity.name}"
  end
end

def create_admin
  ActiveRecord::Base.connection.reset_pk_sequence!(:users)
  User.create!(name: 'admin', email: 'ecorneli@iwu.edu', password: '12345')
end

def seed_questionnaires
  Questionnaire.create!(id: 1, title: "Demo questionnaire", user_id: 1)
  puts "#{Questionnaire.count} questionnaire created"
end

seed_categories(categories_data)
seed_tags(tags_data)
seed_sections(sections)
seed_questions(questions_data)
seed_options(options_data)
create_admin
seed_questionnaires
