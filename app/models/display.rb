class Display < PcPart
  	has_many :display_builds
	has_many :builds, through: :optical_drive_builds
end
