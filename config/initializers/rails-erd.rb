require "rails_erd/domain"

# Discover all models that are currently loaded...
domain = RailsERD::Domain.generate

# Which entities do we have? Each entity corresponds to a model.
#domain.entities=domain.entities + RailsERD::Domain::Entity.from_models( ActiveRecord::Base.descendants.select{|a| a.parent==Blogit})

#spec = Gem::Specification.find_by_name("cucumber")
#gem_root = spec.gem_dir
#gem_lib = gem_root + "/lib"

# Blogit.constants.collect{|k| Blogit.const_get(k)}.select {|k| k.is_a? Class and k.extend? ActiveRecord::Base }