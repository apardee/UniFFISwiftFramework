uniffi::setup_scaffolding!("uniffi_swift_framework");

#[derive(uniffi::Object)]
pub struct BridgedStruct {
    pub name: String,
    pub value: u32,
}

#[uniffi::export]
impl BridgedStruct {

    #[uniffi::constructor]
    pub fn new(name: String, value: u32) -> Self {
        BridgedStruct { name, value }
    }

    pub fn get_name(&self) -> String {
        self.name.clone()
    }

    pub fn get_value(&self) -> u32 {
        self.value
    }
}

#[uniffi::export]
fn test_hello_world() {
    println!("Hello, world!");
}
