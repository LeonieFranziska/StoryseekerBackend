package libraryProjectGroup.libraryProject.zitate;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ZitatService {

    private final ZitatRepository zitatRepository;

    public ZitatService(ZitatRepository zitatRepository) {
        this.zitatRepository = zitatRepository;
    }

    public Zitat getZufallsZitat() {
        long gesamtzahl = zitatRepository.count();
        int zufallszahl = (int)(Math.random() * gesamtzahl);
        Optional<Zitat> zitat = zitatRepository.findById(zufallszahl);
        return zitat.orElse(null);
    }
}
