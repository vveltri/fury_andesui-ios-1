 #!/usr/bin/env ruby
require 'fileutils'



class GenerateAssets

	XCODE_IMAGE_PATH = "LibraryComponents/Assets/Images.xcassets/"


	def initialze()
		puts 'path from original content folder?'
		contentFolderPath = gets.chomp

		puts 'path from project folder?'
		projectFolderPath = gets.chomp

		copy_originals_to_imageset(contentFolderPath,projectFolderPath)
	end

	def copy_originals_to_imageset(contentFolderPath,projectFolderPath)
		Dir[contentFolderPath+'/offline/1x mdpi/*'].each do |fname|
			image_name = get_file_name(fname)
			dst = get_destination_file(fname,projectFolderPath)
			create_imageset_folder(dst)
    		copy_with_path(fname, dst)
    		create_contents_file(dst,image_name)
		end
		Dir[contentFolderPath+'/offline/2x xhdpi/*'].each do |fname|
			dst = get_destination_file(fname,projectFolderPath)
    		edited_image_name = edit_image_file_name(fname,"-1")
    		copy_with_path(fname, dst + edited_image_name)
		end
		Dir[contentFolderPath+'/offline/3x xxhdpi/*'].each do |fname|
    		dst = get_destination_file(fname,projectFolderPath)
    		edited_image_name = edit_image_file_name(fname,"-2")
    		copy_with_path(fname, dst + edited_image_name)
		end
	end

	def create_imageset_folder(dst)
		Dir.mkdir(dst) unless File.exists?(dst)
		cli_output(dst + " folder created")
	end

	def create_contents_file(file_path, file_name)
		content = generate_contents_file(file_name)
		create_file(file_path + "Contents.json",content)
		cli_output(file_path + "Contents.json")
	end

	def create_file(name,content)
		out_file = File.new(name, "w")
		out_file.puts(content)
		out_file.close
	end

	def get_destination_file(fname,projectFolderPath)
		imageset_folder = format_imageset_folder_name(fname)
		projectFolderPath + XCODE_IMAGE_PATH + imageset_folder
	end

	def copy_with_path(src, dst)
		FileUtils.mkdir_p(File.dirname(dst))
		FileUtils.cp(src, dst)
		cli_output(src + " copied to " + dst)
	end

	def format_imageset_folder_name(path_name)
		path_name.split('/').last.split('.').first + '.imageset/'
	end

	def get_file_name(path_file)
		path_file.split('/').last.split('.').first
	end

	def edit_image_file_name(path_file, edition)
		fileName = get_file_name(path_file)
		extension = path_file.split('/').last.split('.').last
		fileName + edition +'.'+ extension
	end

	def cli_output(message)
		puts message
	end

	def generate_contents_file(file_name)
		return '{
		  "images" : [
		    {
		      "idiom" : "universal",
		      "filename" : "%1$s.png",
		      "scale" : "1x"
		    },
		    {
		      "idiom" : "universal",
		      "filename" : "%1$s-1.png",
		      "scale" : "2x"
		    },
		    {
		      "idiom" : "universal",
		      "filename" : "%1$s-2.png",
		      "scale" : "3x"
		    }
		  ],
		  "info" : {
		    "version" : 1,
		    "author" : "xcode"
		  }
		}' % [file_name]
	end

end

ga = GenerateAssets.new
ga.initialze


# Crear folder con el nombre del asset
# Generar Contests.json


#LibraryComponents/Assets/Images.xcassets/andes_control_y_accion_buscar_16.imageset/Contents.json
#LibraryComponents/Assets/Images.xcassets/andes_control_y_accion_buscar_16.imageset/andes_control_y_accion_buscar_16-1.png
#LibraryComponents/Assets/Images.xcassets/andes_control_y_accion_buscar_16.imageset/andes_control_y_accion_buscar_16-2.png
#LibraryComponents/Assets/Images.xcassets/andes_control_y_accion_buscar_16.imageset/andes_control_y_accion_buscar_16.png


# CREAR FILE LibraryComponents/Assets/Images.xcassets/andes_control_y_accion_buscar_16.imageset/Contents.json
#{
#  "images" : [
#    {
#      "idiom" : "universal",
#      "filename" : "andes_control_y_accion_buscar_16.png",
#      "scale" : "1x"
#    },
#    {
#      "idiom" : "universal",
#      "filename" : "andes_control_y_accion_buscar_16-1.png",
#      "scale" : "2x"
#    },
#    {
#      "idiom" : "universal",
#      "filename" : "andes_control_y_accion_buscar_16-2.png",
#      "scale" : "3x"
#    }
#  ],
#  "info" : {
#    "version" : 1,
#    "author" : "xcode"
#  }
#}