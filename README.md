# iOS

## 包管理器

- cocoaPods

  OC + Swift

- carthage

  OC + Swift

- SPM

  Swift

## 布局

- Frame

- Masonry

- StackView

## project.pbxproj - Xcode利用该文件内容组织项目在Xcode中的呈现方式，project及target相关的配置也保存在其中

```ts
{
  // 未知
  archiveVersion: 1,
  // 未知
  classes: {},
  // 对应Xcode版本，<=11=>53，v12=>54，v13=>55，v14=>56，规律递增
  objectVersion: number,
  // 以Hash为key的对象，对象之间的引用通过指定Hash来实现
  objects: {
    // PBXBuildFile section
    
    // PBXContainerItemProxy section
    
    // PBXFileReference section
    
    // PBXFrameworksBuildPhase section
    
    // PBXGroup section 
    
    // PBXNativeTarget section - project所有的targets，每个target描述了
    
    // PBXProject section - 描述了project的一些属性，比如mainGroup，buildConfigurationList，包含的targets，兼容的Xcode版本等
    
    // PBXResourcesBuildPhase section - target对应的build phase中的Copy Bundle Resources
    
    // PBXSourcesBuildPhase section - target对应的build phase中的Compile Sources
    
    // PBXTargetDependency section - target对应的build phase中的Target Dependencies
    
    // XCBuildConfiguration section - 描述了project和targets的buildSettings，每个buildConfiguration对应一个buildSettings
    
    // XCConfigurationList section - 描述了project和targets的buildConfigurations
  },
  // Xcode从rootObject的Hash值对应的对象解析项目
  rootObject: Hash
}
```
