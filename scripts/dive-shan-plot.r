
	library( "ggplot2" )

	error_bomb <- function( arg ) {
		#Difine a error exit function.
		print( "ERROR!", quote = FALSE )

		if ( arg == "no_file_name") {
			print( "Input file name and output file name are REQUIRED.", quote = FALSE )
		} else if ( arg == "inadequate_arg" ) {
			print( "Inadequate argument.", quote = FALSE )
		} else if ( arg == "no_input_file_name" ) {
			print( "Input file name is REQUIRED.", quote = FALSE )
		} else if ( arg == "no_output_file_name" ) {
			print( "Output file name is REQUIRED.", quote = FALSE )
		}

		print( "Program halted!!!", quote = FALSE )

		q( "no" )
	}

	args_list <- commandArgs( trailingOnly = TRUE )
	print( args_list )

	arg_len <- length( commandArgs(trailingOnly = TRUE) )
	#print( arg_len )

	arg_i <- NULL #Input file name.
	arg_o <- NULL #Output file name.
	arg_w <- 2000 #Size of width.
	arg_h <- 1800 #Size of height.
	arg_c <- 0    #Colorize.

	if ( arg_len < 4) { error_bomb( "no_file_name" ) }

	i <- 1
	while ( i <= arg_len ) {
		#Command line parser.
		arg <- args_list[i]
		#print( arg )
		if      ( arg == "-i" ) { arg_i <- args_list[i + 1] }
		else if ( arg == "-o" ) { arg_o <- args_list[i + 1] }
		else if ( arg == "-w" ) { arg_w <- as.integer( args_list[i + 1] ) }
		else if ( arg == "-h" ) { arg_h <- as.integer( args_list[i + 1] ) }
		else if ( arg == "-c" ) { arg_c <- as.integer( args_list[i + 1] ) }
		else                    { error_bomb( "inadequate_arg" ) }

		i = i + 2
	}

	#Check file name.
	if ( is.null(arg_i) == TRUE || is.na(arg_i) == TRUE ) { error_bomb( "no_input_file_name" ) }
	if ( is.null(arg_o) == TRUE || is.na(arg_o) == TRUE ) { error_bomb( "no_output_file_name" ) }

	#Show parameters.
	msg_i <- paste( "Input file name     :", arg_i )
	msg_o <- paste( "Output file name    :", arg_o )
	msg_w <- paste( "Size of width / px  :", arg_w )
	msg_h <- paste( "Size of height / px :", arg_h )
	msg_c <- paste( "Colorize            :", arg_c )
	print( msg_i, quote = FALSE )
	print( msg_o, quote = FALSE )
	print( msg_w, quote = FALSE )
	print( msg_h, quote = FALSE )
	print( msg_c, quote = FALSE )

	#Set color types.
	#Pale blue -> Strong Blue
	col_low  <- "#74DBEF"
	col_mid  <- "#00D1FF"
	col_high <- "#264E86"
	if ( arg_c == 0 ) {
		#Default color.
		#col_low  <- "#74DBEF"
		#col_mid  <- "#00D1FF"
		#col_high <- "#264E86"
	} else if ( arg_c == 1 ) {
		#Yellow -> Orange -> Red
		col_low  <- "#FFFF00"
		col_mid  <- "#FFA500"
		col_high <- "#FF0000"
	} else if ( arg_c == 2 ) {
		#Green -> Cyan -> Blue
		col_low  <- "#1DE4BD"
		col_mid  <- "#1AC9E6"
		col_high <- "#176BA0"
	} else if ( arg_c == 3 ) {
		#Green -> Yellow -> Red
		col_low  <- "#00FF00"
		col_mid  <- "#FFFF00"
		col_high <- "#FF0000"
	} else if ( arg_c == 4 ) {
		#V a p o r W a v e
		col_low  <- "#FFD700"
		col_mid  <- "#FF00FF"
		col_high <- "#4158D0"
	} else {
		#Do nothing.
	}

	#Read the input file.
	dat <- read.table( arg_i, header = TRUE )
	#print( dat )

	#ggplot
	output <- ggplot( data = dat, aes(x = num, xend = num, y = ent, yend = ent, color = ent) ) +
	theme_light() +
	xlab( "Site" ) +
	ylab( "Shannon's entropy" ) +
	geom_segment( aes(x = num, xend = num, y = 0, yend = ent), colour = "gray" ) +
	geom_point() +
	scale_color_gradient2( name = "", low = col_low, mid = col_mid, high = col_high, midpoint = max(dat$ent)/2 )

	#Save the result graph.
	out_name <- paste( arg_o, ".png", sep = "" )

	ggsave( filename = out_name, plot = output, unit = "px", width = arg_w, height = arg_h )

	paste( out_name, "was generated." )

	print( "Program completed !!!", quote = FALSE )