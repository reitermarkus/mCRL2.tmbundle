TM_LANGUAGE = Syntaxes/mCRL2.tmLanguage
CSON = https://raw.githubusercontent.com/Whazor/language-mcrl2/master/grammars/mcrl2.cson

all: $(TM_LANGUAGE)

$(TM_LANGUAGE):
	mkdir -p $(dir $(TM_LANGUAGE))
	curl -L $(CSON) | cson2json | plutil -convert xml1 - -o $@
	/usr/libexec/PlistBuddy -c "Add :uuid string '$(shell /usr/libexec/PlistBuddy -c "Print uuid" Info.plist)'" $@

.PHONY: clean
clean:
	$(RM) $(TM_LANGUAGE)
