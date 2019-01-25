# README

IAWA is a visual exhibit of selected items from the International Archive of Women in Architecture, a joint partnership between the College of Architecture and Urban Studies and the University Libraries at Virginia Tech.

It is a [Hyrax 2.1](https://github.com/samvera/hyrax/tree/v2.1.0)-based application.

## Local Development Installation

This project is designed to be built using [VTUL/InstallScripts](https://github.com/VTUL/InstallScripts/). For deploying on your local machine, follow the steps below.

```
$ git clone git@github.com:VTUL/InstallScripts.git
$ cd InstallScripts
$ cp ansible/example_site_secrets.yml ansible/site_secrets.yml
```

Within your `ansible/site_secrets.yml`, set the `project_name: 'iawa'`.

This application is designed to work with the Virginia Tech LDAP service to authenticate users and admins with two files.

1. Create `ansible/local_files/user_list.txt` with the following information for each user authorized to use the site:

```
<uid1> <pid1>
<uid2> <pid2>
...
```

2. Create `ansible/local_files/admin_list.txt` with the following information for each admin authorized to use the site:

```
<pid2>
<pid3>
...
```

Finally, run `vagrant up` to bring your VM. You should be able to access the application at https://iawa.dld.lib.vt.edu/.

## Modifying the carousel images.

To modify your homepage carousel images, do the following:

* Modify your `ansible/site_secrets.yml` to point to a package of images to unpack on the server to be used for the carousel.

  ```
  # Carousel package (for IAWA)
  carousel_pkg: 'carousel.tar.gz'
  ```

  This package will need to be created and copied into `ansible\local_files`. This package will be unpacked on your VM in `app/assets/images/vtul/carousel/`.
  The following is an example of the carousel package contents:
 
  ```
  Susana_Torre/Ms1990_016_F026_014_Garvey_Dr_007_25p.jpg
  Melita_Rodeck/Church.jpg
  Melita_Rodeck/Rodeck_Vienna.jpg
  Marie_Louise_Laleyan/Ms2013_090_B005_015_Cunningham_Ph_001_copy.jpg
  Sigrid_Rupp/rupp.jpg
  Dorothee_Stelzer_King/Ms2013_023_F003_019_Austellungbau_Dr_001.jpg
  Zelma_Wilson/Ms1991_046_MeditationGroup_B094_015_copy_25p.jpg
  Zelma_Wilson/Ms1991_046_MeditationGroup_B094_002_25p.jpg
  iawa_logo.jpg
  Jean_Linden_Young/Ms1998_022_B001_F002_001_Pro_Ms_031.jpg
  Eleanore_Pettersen/00002_50p.jpg
  IAWA_Portraits/ArchitectPortraits.jpg
  Alexander/Ms2008_089_B001_F007_001_SecondSt_Ms_001.jpg
  ```

  If you forget to unpack these images, the carousel should still function, but without any of the images showing.

* Modify `config/initializers/carousel_config.rb` to set the order of the images to be displayed. For example:

  ```
  Rails.application.configure do
    config.carousel_images = %w{
      iawa_logo.jpg 
      Alexander/Ms2008_089_B001_F007_001_SecondSt_Ms_001.jpg
      Melita_Rodeck/Church.jpg
      Melita_Rodeck/Rodeck_Vienna.jpg
      Sigrid_Rupp/rupp.jpg
      Dorothee_Stelzer_King/Ms2013_023_F003_019_Austellungbau_Dr_001.jpg
      Zelma_Wilson/Ms1991_046_MeditationGroup_B094_015_copy_25p.jpg
      Zelma_Wilson/Ms1991_046_MeditationGroup_B094_002_25p.jpg
      Jean_Linden_Young/Ms1998_022_B001_F002_001_Pro_Ms_031.jpg
      Susana_Torre/Ms1990_016_F026_014_Garvey_Dr_007_25p.jpg
      Marie_Louise_Laleyan/Ms2013_090_B005_015_Cunningham_Ph_001_copy.jpg 
      Eleanore_Pettersen/00002_50p.jpg
      IAWA_Portraits/ArchitectPortraits.jpg
    }
  end
  ```

* Modify `config/locales/en.yml` to set the image text. For example:

  ```
  en:
    carousel:
      slide_1:
        header: "Welcome to the IAWA Online Collections"
        text: "Browse through selected items from the personal collections of 20th century women architects"
      slide_2:
        header: "Alexander"
        text: ""
      slide_3:
        header: "Melita Rodeck"
        text: ""
      slide_4:
        header: "Melita Rodeck"
        text: ""
      slide_5:
        header: "Sigrid Rupp"
        text: ""
      slide_6:
        header: "Dorothee Stelzer King"
        text: ""
      slide_7:
        header: "Zelma Wilson"
        text: ""
      slide_8:
        header: "Zelma Wilson"
        text: ""
      slide_9:
        header: "Jean Linden Young"
        text: ""
      slide_10:
        header: "Susana Torre"
        text: ""
      slide_11:
        header: "Marie Louise Laleyan"
        text: ""
      slide_12:
        header: "Eleanore Pettersen"
        text: ""
      slide_13:
        header: "IAWA Portraits"
        text: "Architect Portraits"
  ```

* Run `vagrant provision` to copy over your package onto the VM and unpack it.
* You may need to run `sudo service nginx restart` as the `vagrant` user in order to see your changes.
