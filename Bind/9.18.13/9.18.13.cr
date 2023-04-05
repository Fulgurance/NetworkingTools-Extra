class Target < ISM::Software

    def configure
        super

        configureSource([   "--prefix=/usr",
                            !option("Nghttp2") ? "--disable-doh" : ""],
                            buildDirectoryPath)
    end

    def build
        super

        makeSource(path: buildDirectoryPath)
    end

    def prepareInstallation
        super

        makeSource(["DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}","install"],buildDirectoryPath)
    end

end
