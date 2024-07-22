# assigns an urgency level as a string to apply this as a css class
module JobsHelper
  def urgency_class(urgency_level)
    case urgency_level
    when 1
      'urgency-low'
    when 2
      'urgency-medium'
    when 3
      'urgency-high'
    when 4
      'urgency-very-high'
    when 5
      'urgency-urgent'
    else
      'urgency-default'
    end
  end
end

module JobsHelper
  def image_for_category(category)
    case category
    when 'City Hall'
      'city_hall.jpg'
    when 'Hospital'
      'hospital.jpg'
    when 'Dentist'
      'dentist.jpg'
    when 'Doctor Visit'
      'doctor.jpg'
    when 'Apartment Search'
      'apartment_search.jpg'
    when 'Document Translation'
      'document_translation.jpg'
    else # 'Other' or any category not explicitly listed
      'default.jpg'
    end
  end
end