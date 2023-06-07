from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

   def __int__(self):
       self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_card_and_checkout(self,productsList):
        i = 1
        productsTitles = self.selLib.get_webelements("css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])[+str(i)]/button")

            i = i + 1



