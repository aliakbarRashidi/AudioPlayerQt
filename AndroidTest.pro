QT += quick
QT += quickcontrols2
QT += widgets
QT += multimedia
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    inputhandler.cpp \
    ../../../taglib-1.11.1/taglib/ape/apefile.cpp \
    ../../../taglib-1.11.1/taglib/ape/apefooter.cpp \
    ../../../taglib-1.11.1/taglib/ape/apeitem.cpp \
    ../../../taglib-1.11.1/taglib/ape/apeproperties.cpp \
    ../../../taglib-1.11.1/taglib/ape/apetag.cpp \
    ../../../taglib-1.11.1/taglib/asf/asfattribute.cpp \
    ../../../taglib-1.11.1/taglib/asf/asffile.cpp \
    ../../../taglib-1.11.1/taglib/asf/asfpicture.cpp \
    ../../../taglib-1.11.1/taglib/asf/asfproperties.cpp \
    ../../../taglib-1.11.1/taglib/asf/asftag.cpp \
    ../../../taglib-1.11.1/taglib/flac/flacfile.cpp \
    ../../../taglib-1.11.1/taglib/flac/flacmetadatablock.cpp \
    ../../../taglib-1.11.1/taglib/flac/flacpicture.cpp \
    ../../../taglib-1.11.1/taglib/flac/flacproperties.cpp \
    ../../../taglib-1.11.1/taglib/flac/flacunknownmetadatablock.cpp \
    ../../../taglib-1.11.1/taglib/it/itfile.cpp \
    ../../../taglib-1.11.1/taglib/it/itproperties.cpp \
    ../../../taglib-1.11.1/taglib/mod/modfile.cpp \
    ../../../taglib-1.11.1/taglib/mod/modfilebase.cpp \
    ../../../taglib-1.11.1/taglib/mod/modproperties.cpp \
    ../../../taglib-1.11.1/taglib/mod/modtag.cpp \
    ../../../taglib-1.11.1/taglib/mp4/mp4atom.cpp \
    ../../../taglib-1.11.1/taglib/mp4/mp4coverart.cpp \
    ../../../taglib-1.11.1/taglib/mp4/mp4file.cpp \
    ../../../taglib-1.11.1/taglib/mp4/mp4item.cpp \
    ../../../taglib-1.11.1/taglib/mp4/mp4properties.cpp \
    ../../../taglib-1.11.1/taglib/mp4/mp4tag.cpp \
    ../../../taglib-1.11.1/taglib/mpc/mpcfile.cpp \
    ../../../taglib-1.11.1/taglib/mpc/mpcproperties.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v1/id3v1genres.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v1/id3v1tag.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/attachedpictureframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/chapterframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/commentsframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/eventtimingcodesframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/generalencapsulatedobjectframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/ownershipframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/podcastframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/popularimeterframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/privateframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/relativevolumeframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/synchronizedlyricsframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/tableofcontentsframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/textidentificationframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/uniquefileidentifierframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/unknownframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/unsynchronizedlyricsframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/urllinkframe.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2extendedheader.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2footer.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2frame.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2framefactory.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2header.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2synchdata.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2tag.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/mpegfile.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/mpegheader.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/mpegproperties.cpp \
    ../../../taglib-1.11.1/taglib/mpeg/xingheader.cpp \
    ../../../taglib-1.11.1/taglib/ogg/flac/oggflacfile.cpp \
    ../../../taglib-1.11.1/taglib/ogg/opus/opusfile.cpp \
    ../../../taglib-1.11.1/taglib/ogg/opus/opusproperties.cpp \
    ../../../taglib-1.11.1/taglib/ogg/speex/speexfile.cpp \
    ../../../taglib-1.11.1/taglib/ogg/speex/speexproperties.cpp \
    ../../../taglib-1.11.1/taglib/ogg/vorbis/vorbisfile.cpp \
    ../../../taglib-1.11.1/taglib/ogg/vorbis/vorbisproperties.cpp \
    ../../../taglib-1.11.1/taglib/ogg/oggfile.cpp \
    ../../../taglib-1.11.1/taglib/ogg/oggpage.cpp \
    ../../../taglib-1.11.1/taglib/ogg/oggpageheader.cpp \
    ../../../taglib-1.11.1/taglib/ogg/xiphcomment.cpp \
    ../../../taglib-1.11.1/taglib/riff/aiff/aifffile.cpp \
    ../../../taglib-1.11.1/taglib/riff/aiff/aiffproperties.cpp \
    ../../../taglib-1.11.1/taglib/riff/wav/infotag.cpp \
    ../../../taglib-1.11.1/taglib/riff/wav/wavfile.cpp \
    ../../../taglib-1.11.1/taglib/riff/wav/wavproperties.cpp \
    ../../../taglib-1.11.1/taglib/riff/rifffile.cpp \
    ../../../taglib-1.11.1/taglib/s3m/s3mfile.cpp \
    ../../../taglib-1.11.1/taglib/s3m/s3mproperties.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tbytevector.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tbytevectorlist.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tbytevectorstream.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tdebug.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tdebuglistener.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tfile.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tfilestream.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tiostream.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tlist.tcc \
    ../../../taglib-1.11.1/taglib/toolkit/tmap.tcc \
    ../../../taglib-1.11.1/taglib/toolkit/tpropertymap.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/trefcounter.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tstring.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tstringlist.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/tzlib.cpp \
    ../../../taglib-1.11.1/taglib/toolkit/unicode.cpp \
    ../../../taglib-1.11.1/taglib/trueaudio/trueaudiofile.cpp \
    ../../../taglib-1.11.1/taglib/trueaudio/trueaudioproperties.cpp \
    ../../../taglib-1.11.1/taglib/wavpack/wavpackfile.cpp \
    ../../../taglib-1.11.1/taglib/wavpack/wavpackproperties.cpp \
    ../../../taglib-1.11.1/taglib/xm/xmfile.cpp \
    ../../../taglib-1.11.1/taglib/xm/xmproperties.cpp \
    ../../../taglib-1.11.1/taglib/audioproperties.cpp \
    ../../../taglib-1.11.1/taglib/fileref.cpp \
    ../../../taglib-1.11.1/taglib/tag.cpp \
    ../../../taglib-1.11.1/taglib/tagunion.cpp \
    ../../../taglib-1.11.1/taglib/tagutils.cpp \
    coverimageprovider.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    inputhandler.h \
    ../../../taglib-1.11.1/taglib/ape/apefile.h \
    ../../../taglib-1.11.1/taglib/ape/apefooter.h \
    ../../../taglib-1.11.1/taglib/ape/apeitem.h \
    ../../../taglib-1.11.1/taglib/ape/apeproperties.h \
    ../../../taglib-1.11.1/taglib/ape/apetag.h \
    ../../../taglib-1.11.1/taglib/asf/asfattribute.h \
    ../../../taglib-1.11.1/taglib/asf/asffile.h \
    ../../../taglib-1.11.1/taglib/asf/asfpicture.h \
    ../../../taglib-1.11.1/taglib/asf/asfproperties.h \
    ../../../taglib-1.11.1/taglib/asf/asftag.h \
    ../../../taglib-1.11.1/taglib/asf/asfutils.h \
    ../../../taglib-1.11.1/taglib/flac/flacfile.h \
    ../../../taglib-1.11.1/taglib/flac/flacmetadatablock.h \
    ../../../taglib-1.11.1/taglib/flac/flacpicture.h \
    ../../../taglib-1.11.1/taglib/flac/flacproperties.h \
    ../../../taglib-1.11.1/taglib/flac/flacunknownmetadatablock.h \
    ../../../taglib-1.11.1/taglib/it/itfile.h \
    ../../../taglib-1.11.1/taglib/it/itproperties.h \
    ../../../taglib-1.11.1/taglib/mod/modfile.h \
    ../../../taglib-1.11.1/taglib/mod/modfilebase.h \
    ../../../taglib-1.11.1/taglib/mod/modfileprivate.h \
    ../../../taglib-1.11.1/taglib/mod/modproperties.h \
    ../../../taglib-1.11.1/taglib/mod/modtag.h \
    ../../../taglib-1.11.1/taglib/mp4/mp4atom.h \
    ../../../taglib-1.11.1/taglib/mp4/mp4coverart.h \
    ../../../taglib-1.11.1/taglib/mp4/mp4file.h \
    ../../../taglib-1.11.1/taglib/mp4/mp4item.h \
    ../../../taglib-1.11.1/taglib/mp4/mp4properties.h \
    ../../../taglib-1.11.1/taglib/mp4/mp4tag.h \
    ../../../taglib-1.11.1/taglib/mpc/mpcfile.h \
    ../../../taglib-1.11.1/taglib/mpc/mpcproperties.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v1/id3v1genres.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v1/id3v1tag.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/attachedpictureframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/chapterframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/commentsframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/eventtimingcodesframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/generalencapsulatedobjectframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/ownershipframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/podcastframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/popularimeterframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/privateframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/relativevolumeframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/synchronizedlyricsframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/tableofcontentsframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/textidentificationframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/uniquefileidentifierframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/unknownframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/unsynchronizedlyricsframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/frames/urllinkframe.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2extendedheader.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2footer.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2frame.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2framefactory.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2header.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2synchdata.h \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2tag.h \
    ../../../taglib-1.11.1/taglib/mpeg/mpegfile.h \
    ../../../taglib-1.11.1/taglib/mpeg/mpegheader.h \
    ../../../taglib-1.11.1/taglib/mpeg/mpegproperties.h \
    ../../../taglib-1.11.1/taglib/mpeg/mpegutils.h \
    ../../../taglib-1.11.1/taglib/mpeg/xingheader.h \
    ../../../taglib-1.11.1/taglib/ogg/flac/oggflacfile.h \
    ../../../taglib-1.11.1/taglib/ogg/opus/opusfile.h \
    ../../../taglib-1.11.1/taglib/ogg/opus/opusproperties.h \
    ../../../taglib-1.11.1/taglib/ogg/speex/speexfile.h \
    ../../../taglib-1.11.1/taglib/ogg/speex/speexproperties.h \
    ../../../taglib-1.11.1/taglib/ogg/vorbis/vorbisfile.h \
    ../../../taglib-1.11.1/taglib/ogg/vorbis/vorbisproperties.h \
    ../../../taglib-1.11.1/taglib/ogg/oggfile.h \
    ../../../taglib-1.11.1/taglib/ogg/oggpage.h \
    ../../../taglib-1.11.1/taglib/ogg/oggpageheader.h \
    ../../../taglib-1.11.1/taglib/ogg/xiphcomment.h \
    ../../../taglib-1.11.1/taglib/riff/aiff/aifffile.h \
    ../../../taglib-1.11.1/taglib/riff/aiff/aiffproperties.h \
    ../../../taglib-1.11.1/taglib/riff/wav/infotag.h \
    ../../../taglib-1.11.1/taglib/riff/wav/wavfile.h \
    ../../../taglib-1.11.1/taglib/riff/wav/wavproperties.h \
    ../../../taglib-1.11.1/taglib/riff/rifffile.h \
    ../../../taglib-1.11.1/taglib/riff/riffutils.h \
    ../../../taglib-1.11.1/taglib/s3m/s3mfile.h \
    ../../../taglib-1.11.1/taglib/s3m/s3mproperties.h \
    ../../../taglib-1.11.1/taglib/toolkit/taglib.h \
    ../../../taglib-1.11.1/taglib/toolkit/tbytevector.h \
    ../../../taglib-1.11.1/taglib/toolkit/tbytevectorlist.h \
    ../../../taglib-1.11.1/taglib/toolkit/tbytevectorstream.h \
    ../../../taglib-1.11.1/taglib/toolkit/tdebug.h \
    ../../../taglib-1.11.1/taglib/toolkit/tdebuglistener.h \
    ../../../taglib-1.11.1/taglib/toolkit/tfile.h \
    ../../../taglib-1.11.1/taglib/toolkit/tfilestream.h \
    ../../../taglib-1.11.1/taglib/toolkit/tiostream.h \
    ../../../taglib-1.11.1/taglib/toolkit/tlist.h \
    ../../../taglib-1.11.1/taglib/toolkit/tmap.h \
    ../../../taglib-1.11.1/taglib/toolkit/tpropertymap.h \
    ../../../taglib-1.11.1/taglib/toolkit/trefcounter.h \
    ../../../taglib-1.11.1/taglib/toolkit/tstring.h \
    ../../../taglib-1.11.1/taglib/toolkit/tstringlist.h \
    ../../../taglib-1.11.1/taglib/toolkit/tutils.h \
    ../../../taglib-1.11.1/taglib/toolkit/tzlib.h \
    ../../../taglib-1.11.1/taglib/toolkit/unicode.h \
    ../../../taglib-1.11.1/taglib/trueaudio/trueaudiofile.h \
    ../../../taglib-1.11.1/taglib/trueaudio/trueaudioproperties.h \
    ../../../taglib-1.11.1/taglib/wavpack/wavpackfile.h \
    ../../../taglib-1.11.1/taglib/wavpack/wavpackproperties.h \
    ../../../taglib-1.11.1/taglib/xm/xmfile.h \
    ../../../taglib-1.11.1/taglib/xm/xmproperties.h \
    ../../../taglib-1.11.1/taglib/audioproperties.h \
    ../../../taglib-1.11.1/taglib/fileref.h \
    ../../../taglib-1.11.1/taglib/tag.h \
    ../../../taglib-1.11.1/taglib/taglib_export.h \
    ../../../taglib-1.11.1/taglib/tagunion.h \
    ../../../taglib-1.11.1/taglib/tagutils.h \
    coverimageprovider.h

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/res/drawable-ldpi/icon.png \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/build.gradle \
    android/gradlew.bat \
    ../../../taglib-1.11.1/taglib/ape/ape-tag-format.txt \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2.2.0.txt \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2.3.0.txt \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2.4.0-frames.txt \
    ../../../taglib-1.11.1/taglib/mpeg/id3v2/id3v2.4.0-structure.txt \
    ../../../taglib-1.11.1/taglib/taglib_config.h.cmake \
    ../../../taglib-1.11.1/taglib/CMakeLists.txt


ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

INCLUDEPATH += $$PWD/../../../taglib-1.11.1
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/mod
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/it
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/s3m
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/ape
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/asf
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/flac
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/mp4
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/mpc
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/mpeg
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/ogg
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/xm
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/riff
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/toolkit
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/trueaudio
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/wavpack
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/mpeg/id3v1
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/mpeg/id3v2
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/mpeg/id3v2/frames
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/ogg/flac
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/ogg/opus
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/ogg/speex
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/ogg/vorbis
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/riff/aiff
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/taglib/riff/wav
INCLUDEPATH += $$PWD/../../../taglib-1.11.1/build

HEADERS += $$PWD/../../../taglib-1.11.1/build/config.h
HEADERS += $$PWD/../../../taglib-1.11.1/build/taglib_config.h



