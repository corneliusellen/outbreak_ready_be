class ApplicationController < ActionController::API

  def identify_questionnaire_tags
    questionnaire = Questionnaire.find(params[:questionnaire_id])
    @tags = questionnaire.tags.map {|tag| tag.id}
    @tags.push(25)
  end

  def filter_questions(section_id)
    questions = Question.find_questions_with(section_id)
    @filtered = questions.find_all do |question|
      tags = question.all_tags
      classifications = question.all_classifications
      taggings = tags.zip(classifications)
      check_included(taggings)
    end
  end

  def check_included(taggings)
    hash = {1 => [], 2 => [], 3 => []}
    taggings.each do |element|
      hash[element[1]] += [element[0]]
    end
    hash.delete_if {|k,v| v.empty?}
    hash.all? do |tag|
      @tags.include?(tag[1][0]) ||
      @tags.include?(tag[1][1]) ||
      @tags.include?(tag[1][2])
    end
  end
end
