package ruboss.test.cases.serializers {
  import flexunit.framework.TestCase;
  
  import mx.core.Application;
  
  import org.ruboss.Ruboss;
  import org.ruboss.controllers.ModelsController;
  import org.ruboss.events.CacheUpdateEvent;
  import org.ruboss.serializers.XMLSerializer;
  import org.ruboss.utils.TypedArray;
  
  import ruboss.test.models.Author;
  import ruboss.test.models.Book;
  import ruboss.test.models.Store;

  public class XMLSerializerTest extends TestCase {
    
    private var xml:XMLSerializer;
    
    public function XMLSerializerTest(methodName:String) {
      super(methodName);
      xml = new XMLSerializer;
    }
    
    public function testSimpleProperties():void {
      var simplePropertiesSource:XML = TestApp(Application.application).simple_properties;
      var simpleProperties:TypedArray = xml.unmarshall(simplePropertiesSource) as TypedArray;
      
      var models:ModelsController = Ruboss.models;
      trace(simpleProperties);
    }
    
    public function testBasicRelationships():void {
      Ruboss.models.addEventListener(CacheUpdateEvent.ID, onIndex);
      //Ruboss.models.indexAll(Project, Contractor, Task, Location, Category, Actor, PayableAccount, ReceivableAccount);
      Ruboss.models.indexAll(Author, Store, Book);
    }
    
    private function onIndex(event:CacheUpdateEvent):void {
      var models:ModelsController = Ruboss.models;
      trace(event);
    }
  }
}