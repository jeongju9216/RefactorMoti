//
//  EditAchievementView.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/26/24.
//

import UIKit
import FlexLayout
import PinLayout
import JeongDesignSystem

final class EditAchievementView: BaseView {
    
    // MARK: - Interface
    
    var cancelButtonDidTap: UIControl.ControlEventPublisher {
        cancelButton.publisher(for: .touchUpInside)
    }
    var doneButtonDidTap: UIControl.ControlEventPublisher {
        doneButton.publisher(for: .touchUpInside)
    }
    
    
    // MARK: - UI
    
    private let flexBox = UIView()
    private let cancelButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = Text.cancel
        return UIButton(configuration: configuration)
    }()
    private let doneButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = Text.done
        return UIButton(configuration: configuration)
    }()
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.font = Font.textField
        textField.placeholder = Text.textFieldPlaceholder
        textField.returnKeyType = .done
        return textField
    }()
    private let previewView: UIView = {
        let view = UIView()
        view.backgroundColor = JDColor.gray
        return view
    }()
    private let bodyTextView: UITextView = {
        let textView = UITextView()
        textView.text = Text.sampleBody
        return textView
    }()
    
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        flexBox.pin.all(pin.safeArea)
        flexBox.flex.layout()
    }
    
    
    // MARK: - Setup
    
    override func setUpSubview() {
        super.setUpSubview()
        addSubview(flexBox)
    }
    
    override func setUpConstraint() {
        super.setUpConstraint()
        flexBox.flex.define { flex in
            flex.addItem().direction(.row).define { flex in
                flex.addItem(cancelButton)
                flex.addItem().grow(1)
                flex.addItem(doneButton)
            }
            
            flex.addItem(titleTextField).height(Metric.TextField.height).marginVertical(Metric.TextField.verticalOffset).horizontally(Metric.horizontalOffset)
            
            flex.addItem().grow(1).define { flex in
                flex.addItem(previewView).width(100%).aspectRatio(1)
            }
            
            flex.addItem().define { flex in
                flex.addItem(bodyTextView).marginHorizontal(Metric.horizontalOffset)
            }
        }
    }
}


// MARK: - Constant

private extension EditAchievementView {
    
    enum Size {
        
        static let buttonPointSize = 21.0
        static let systemButton = CGSize(width: 44, height: 44)
        static let bodyTextViewHeight = 100.0
        static let doneButton = CGSize(width: 180, height: 60)
    }
    
    enum Metric {
        
        static let horizontalOffset = 20.0
        
        enum TextField {
            
            static let height = 40.0
            static let verticalOffset = 20.0
        }
    }
    
    enum Font {
        
        static let textField = UIFont.boldSystemFont(ofSize: 24)
    }
    
    enum Text {
        
        static let cancel = "취소"
        static let done = "업로드"
        static let textFieldPlaceholder = "제목을 입력하세요."
        static let sampleBody = """
        친구는 세월의 도둑이다.
        봄부터 흐르는 물은 겨울이 되어도 얼지 않듯이
        마음에서 우러나오는 우적은 역경이 닥친다고 해서 식지 않는다.
        불행했을 때 만난 친구는 가장 소중히 여겨야 한다.
        행복했을 때 함께 기쁨을 누리는 친구보다
        힘들 떄 슬픔을 덜어지는 친구를 더 많이 신뢰할 수 있다.
        부유했을 때는 친구를 사귀기 쉽지만,
        어려울 때는 눈을 씻고 찾아봐도 친구를 찾기 어렵다.
        누군가 진정한 우정을 나누고 있다 할지라도 그 우정을 지키려면 오랜 시간이 걸린다.
        짧은 시간 안에 많은 친구를 얻기란 불가능하다. 왜냐하면
        그들은 진정한 친구가 아니기 때문이다.
        친구란 말하자면 또 하나의 자신이다.
        친구를 보면 그 사람을 알 수 있다.
        현명한 사람과 어리석은 사람은 서로 어울리지 않는다.
        친구는 나를 동정하는 자가 아니라 나를 돕는 자다.
        서로가 고통을 덜어 주지 않는다면 우리는 무엇을 위해 사는 것일까?
        우리는 모두 적막한 세계를 떠도는 나그네다.
        그 여정에서 찾을 수 있는 최고의 선물은 바로 믿음직한 벗이다.
        좋은 벗은 충격을 덜어주는 완충장치와도 같은 것이며
        인생의 길에서 충동을 피할 수 있도록 도와준다.
        우정만이 세상을 하나로 만들 수 있다.
        우정은 영혼의 결혼이다.
        """
    }
}
