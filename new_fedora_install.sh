#! /bin/bash

# Fedora post-install script

# Search for the phrase TODO before running - some things need version numbers specified
# Watch out for things that are commented out - I am testing using Sublime text to do almost everything

# Refresh everything
	sudo dnf upgrade --refresh
	sudo dnf upgrade

# Install new repos
	# Install COPR
		sudo dnf install 'dnf-command(copr)'

	# RPM Fusion
		sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm # RPM Free Repo
		sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm # RPM Non-Free Repo

	# Sublime
		sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
		sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

	# Joplin - commented out because I now use Sublime
		# sudo dnf copr enable taw/joplin

	# CRAN repo
		sudo dnf copr enable iucar/cran
		sudo dnf install R-CoprManager # Makes CRAN work via terminal

	# Upgrade again
		sudo dnf upgrade --refresh
		sudo dnf upgrade

# Install software

	# Install languages
		sudo dnf install -y git R ruby ruby-devel julia mysql-devel mysql-server texlive p7zip

	# Install LaTeX packages
		sudo dnf install -y texlive-booktabs texlive-bibtex texlive-tikz texlive-hyperref texlive-listings texlive-amsmath texlive-enumitem 

	# Install R packages - some of these are probably duplicates via dependencies but it is pretty much everything I use
		sudo dnf install -y R-CRAN-tidyverse R-CRAN-SHELF R-CRAN-brms R-CRAN-zoo R-CRAN-parallely R-CRAN-readbulk R-CRAN-data.table R-CRAN-DATAstudio R-CRAN-FakeR R-CRAN-BACCO R-CRAN-bayesplot R-CRAN-calibrator R-CRAN-caret R-CRAN-cricketdata R-CRAN-cricketr R-CRAN-MySQL R-CRAN-elo R-CRAN-lubridate R-CRAN loo R-CRAN-lme4 R-CRAN-parallel R-CRAN-readr R-CRAN-readxl R-CRAN-extraDistr R-CRAN-rbayesianoptimization R-CRAN-xgboost R-CRAN-tidybayes R-CRAN-forecast R-CRAN-reticulate R-CRAN-leaflet

	# Install python packages - note that Discord.py is installed before py-cord - this is important
		# Do not use dnf because we need specific versions
		pip install --upgrade pip
		pip install wheel Discord.py py-cord pandas gensim spacy nltk requests asyncio python-dotenv importlib_resources pymysql pillow==9.0.1 tabulate sqlalchemy bertopic pandas numpy boto3 scikit-learn xgboost

	# Install ruby gems
		gem install nokogiri discordrb csv daru gnuplotrb distribution sciruby cmdstan rumale json tzinfo rubyzip parallel jekyll mysql2 rubocop

	# Install packages from repo
		sudo dnf install -y vlc thunderbird neofetch putty gparted libreoffice libreoffice-langpack-de clementine Discord steam
		sudo dnf install -y https://zoom.us/client/5.17.5.2543/zoom_x86_64.rpm # Zoom - TODO: update this URL
		# sudo dnf install -y https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm # DBeaver # Commented out to test using Sublime as a database client
		# sudo dnf install -y joplin 

	# Install codecs
		sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
		sudo dnf install lame\* --exclude=lame-devel
		sudo dnf group upgrade --with-optional Multimedia

	# Install Sublime Text
		sudo dnf install -y sublime-text

# Remove bloatware
	sudo dnf remove -y kmail # Replace with Thunderbird
	sudo dnf remove -y dragonplayer # Replace with VLC
	sudo dnf remove -y kwrite # Replace with Sublime
	sudo dnf remove -y kmines # No games
	sudo dnf remove -y kmahjongg #' No games
	sudo dnf remove -y kpat # No games 
	sudo dnf remove -y akonadi-import-wizard # This imports data into KMail etc, but I don't use it
	sudo dnf remove -y kmag # Screen magnifier
	sudo dnf remove -y kaddressbook # I don't use an address book
	sudo dnf remove -y kcalc # No need for a calculator
	sudo dnf remove -y kmouth # Text to speech
	sudo dnf remove -y korganizer # Don't use an organisation program
	sudo dnf remove -y konversation # Don't use IRC
	sudo dnf remove -y kmousetool # Auto clicker
	sudo dnf remove -y krdc # Remote desktop client
	sudo dnf remove -y kwalletmanager5 # Don't use a wallet manager
	sudo dnf remove -y krfb # Remote desktop tool
	sudo dnf remove -y kcharselect # Lets you select a character
	sudo dnf remove -y kfind # File finder - use bash or Dolphin
	sudo dnf remove -y akgregator # RSS aggregator
	sudo dnf remove -y kgpg # Encryption
 	sudo dnf remove -y ark # Use 7zip instead

# Clone whole repo to load dotfiles
	git clone https://github.com/David-Manning/computer-setup.git /home/david/repo/


# Set up KDE
	#plasma-apply-colorscheme
	#plasma-apply-cursortheme
	#plasma-apply-desktoptheme
	#plasma-apply-lookandfeel
	#plasma-apply-wallpaperimage ~/.local/share/wallpapers/YourBackground.jpg 

# Copy dotfiles
	

# Set up printer
	sudo lpadmin -p Davids_Printer -E -v "dnssd://Brother%20HL-L3230CDW%20series._ipp._tcp.local/?uuid=e3248000-80ce-11db-8000-b422008c4450" -m everywhere -D "David's Printer" -L "David's Study"
	lpoptions -p Davids_Printer -o media=A4 -o print-color-mode=color -o sides=two-sided-long-edge -o print-quality=5 -o print-scaling=auto


echo "All done - reboot is recommended"
