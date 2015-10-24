class OpticalDrive < PcPart
	has_many :optical_drive_builds
	has_many :builds, through: :optical_drive_builds
end
